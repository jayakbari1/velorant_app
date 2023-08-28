import 'package:dio/dio.dart';

class SingletonDio {
  SingletonDio._internal();
  static final SingletonDio instance = SingletonDio._internal();

  Dio dio = Dio();
}