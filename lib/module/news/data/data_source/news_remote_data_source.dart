import 'package:dio/dio.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getHeadlineNews();
  Future<NewsResponse> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio client;

  NewsRemoteDataSourceImpl({required this.client});

  @override
  Future<NewsResponse> getHeadlineNews() async {
    try {
      final response = await client.get(
        'top-headlines?q=politic&apiKey=${Constant().apiKey}&pageSize=5',
      );
      return NewsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
          message: e.response != null
              ? 'Error ${e.response!.statusCode}: ${e.response!.statusMessage}'
              : e.message ?? 'Server Error');
    }
  }

  @override
  Future<NewsResponse> getNews() async {
    try {
      final response = await client.get(
        'everything?q=politic&language=en&apiKey=${Constant().apiKey}&pageSize=15',
      );
      return NewsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
          message: e.response != null
              ? 'Error ${e.response!.statusCode}: ${e.response!.statusMessage}'
              : e.message ?? 'Server Error');
    }
  }
}
