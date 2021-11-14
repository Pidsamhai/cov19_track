import 'package:cov19_stats/interceptor/intercentor.dart';
import 'package:cov19_stats/services/service.dart';
import 'package:dio/dio.dart';

class DDCApiClient implements ApiClient {
  static final DDCApiClient _instance = DDCApiClient._internal();

  factory DDCApiClient() => _instance;

  DDCApiClient._internal();

  Dio _buildDio() {
    Dio dio = Dio();
    BaseOptions option = BaseOptions(
      baseUrl: 'https://covid19.ddc.moph.go.th/api/Cases/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio.options = option;
    dio.interceptors.add(CustomInterceptor(
      level: Level1.basic,
      compact: false,
    ));
    return dio;
  }

  @override
  Dio get dio => _buildDio();
}
