import 'package:dartz/dartz.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NetworkInfo networkInfo;
  final NewsLocalDataSource localDataSource;
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, NewsResponse>> getHeadlineNews() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getHeadlineNews();

        localDataSource.saveNewsHeadline(result);
        return Right(result);
      } on ServerException catch (exception) {
        return Left(ServerFailure(exception.message));
      }
    } else {
      try {
        final result = await localDataSource.getNewsHeadline();
        return Right(result);
      } on CacheException catch (exception) {
        return Left(CacheFailure(exception.message));
      }
    }
  }
}
