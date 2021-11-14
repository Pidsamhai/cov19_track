import 'package:dio/dio.dart';

abstract class ApiClient {
  final Dio dio;
  const ApiClient({required this.dio});
}
