import 'package:dartz/dartz.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewsResponse>> getHeadlineNews();
}
