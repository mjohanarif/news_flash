import 'dart:convert';

import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

abstract class NewsLocalDataSource {
  Future<NewsResponse> getNewsHeadline();
  Future<String> saveNewsHeadline(NewsResponse newsList);
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
}
