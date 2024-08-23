import 'dart:convert';

import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

abstract class NewsLocalDataSource {
  Future<NewsResponse> getNewsHeadline();
  Future<String> saveNewsHeadline(NewsResponse newsList);
  Future<NewsResponse> getNews();
  Future<String> saveNews(NewsResponse newsList);
  Future<NewsResponse> filterLocalNews(String query);
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final CacheHandler cacheHandler;

  NewsLocalDataSourceImpl({required this.cacheHandler});

  @override
  Future<NewsResponse> getNewsHeadline() async {
    try {
      final result = await cacheHandler.getCache(
        boxKey: Constant().newsHeadlineKey,
      );

      if (result == null) {
        throw CacheException(message: "Can't get News Headline data");
      }

      return NewsResponse.fromJson(jsonDecode(result));
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }

  @override
  Future<String> saveNewsHeadline(NewsResponse newsList) async {
    try {
      final result = await cacheHandler.setCache(
        boxKey: Constant().newsHeadlineKey,
        value: jsonEncode(
          newsList.toJson(),
        ),
      );
      if (result == null) {
        throw CacheException(message: "Can't Save News Headline data");
      }
      return 'Success saving headline news';
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }

  @override
  Future<NewsResponse> getNews() async {
    try {
      final result = await cacheHandler.getCache(
        boxKey: Constant().newsKey,
      );

      if (result == null) {
        throw CacheException(message: "Can't get News data");
      }

      return NewsResponse.fromJson(jsonDecode(result));
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }

  @override
  Future<String> saveNews(NewsResponse newsList) async {
    try {
      final result = await cacheHandler.setCache(
        boxKey: Constant().newsKey,
        value: jsonEncode(
          newsList.toJson(),
        ),
      );
      if (result == null) {
        throw CacheException(message: "Can't Save News data");
      }
      return 'Success saving news';
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }

  @override
  Future<NewsResponse> filterLocalNews(String query) async {
    try {
      final result = await cacheHandler.getCache(
        boxKey: Constant().newsKey,
      );

      if (result == null) {
        throw CacheException(message: "Can't get filter News data");
      } else if (query.isEmpty) {
        return const NewsResponse(
          status: 'Success',
          totalResults: 0,
          articles: [],
        );
      }

      var temp = NewsResponse.fromJson(jsonDecode(result))
          .articles
          ?.where((element) =>
              (element.title?.toLowerCase().contains(query.toLowerCase()) ??
                  false))
          .toList();

      return NewsResponse(
        status: 'Success',
        totalResults: temp?.length,
        articles: temp,
      );
    } on CacheException catch (e) {
      throw CacheException(message: e.message);
    }
  }
}
