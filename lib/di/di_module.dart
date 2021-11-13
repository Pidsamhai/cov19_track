import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/di/intercentor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  AppDatabase get appDatabase => openConnection();

  @singleton
  Dio ddcService() {
    Dio dio = Dio();
    BaseOptions option = BaseOptions(
      baseUrl: 'https://covid19.ddc.moph.go.th/api/Cases/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio.options = option;
    dio.interceptors.add(
      CustomInterceptor(
        level: Level1.basic,
        compact: false,
      )
    );
    return dio;
  }
}
