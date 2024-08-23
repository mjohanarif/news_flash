import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

class GetHeadlineNewsUsecase
    implements UseCaseFuture<Failure, NewsResponse, void> {
  final NewsRepository repository;

  GetHeadlineNewsUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, NewsResponse>> call(void params) {
    return repository.getHeadlineNews();
  }
}
