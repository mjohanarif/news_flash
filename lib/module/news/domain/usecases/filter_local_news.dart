import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

class FilterLocalNewsUsecase
    implements UseCaseFuture<Failure, NewsResponse, String> {
  final NewsRepository repository;

  FilterLocalNewsUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, NewsResponse>> call(String params) {
    return repository.filterLocalNews(params);
  }
}
