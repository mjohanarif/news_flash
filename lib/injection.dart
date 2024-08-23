import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';
import 'package:path_provider/path_provider.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  await dotenv.load(fileName: 'assets/.env');

  locator
    // Repository
    ..registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(
        networkInfo: locator(),
        localDataSource: locator(),
        remoteDataSource: locator(),
      ),
    )

    // usecase
    ..registerLazySingleton(
      () => GetHeadlineNewsUsecase(
        repository: locator(),
      ),
    )

    // data source
    ..registerLazySingleton<NewsLocalDataSource>(
      () => NewsLocalDataSourceImpl(
        cacheHandler: locator(),
      ),
    )
    ..registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(
        client: locator(),
      ),
    )

    // BLOC
    ..registerFactory(() => GetNewsHeadlineBloc(locator()))

    // external
    ..registerLazySingleton(
      () => Dio()
        ..options = BaseOptions(baseUrl: dotenv.get('BASE_URL'))
        ..interceptors.addAll(
          [
            LogInterceptor(
              requestBody: true,
              responseBody: true,
            ),
          ],
        ),
    )
    ..registerLazySingleton(InternetConnectionChecker.new)
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
        locator(),
      ),
    )
    ..registerLazySingleton(
      () => CacheHandler(
        cache: locator(),
      ),
    )
    ..registerLazySingleton<HiveInterface>(
      () => Hive,
    );
  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init('${appDocDir.path}/db');
  }
}
