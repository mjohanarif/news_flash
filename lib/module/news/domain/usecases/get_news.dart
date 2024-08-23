import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

class GetNewsUsecase implements UseCaseFuture<Failure, NewsResponse, void> {
  final NewsRepository repository;

  GetNewsUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, NewsResponse>> call(void params) {
    return repository.getNews();
  }
}
