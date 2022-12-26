import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @injectable
  Dio get dio => Dio(BaseOptions(connectTimeout: 30000, receiveTimeout: 30000));
}