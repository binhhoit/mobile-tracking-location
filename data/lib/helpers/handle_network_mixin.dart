import 'dart:io';

import 'package:data/common/exceptions.dart';
import 'package:data/model/failures/failure.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

typedef ResponseToModel<T> = T Function(dynamic);

class HandleNetworkMixin {
  Failure handleError(Exception error) {
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.cancel:
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.response:
          if (dioError.response?.statusCode == 401) {
            return const Failure.unAuthenticated();
          }
          return Failure.httpFailure(
              code: dioError.response?.statusCode ?? 400,
              msg: dioError.response?.statusMessage ?? "Có lỗi xảy ra");
        case DioErrorType.other:
          if (dioError.error is ConnectionException) {
            return const Failure.noInternetConnectionFound();
          }
          if (dioError.error is SocketException) {
            return const Failure.noInternetConnectionFound();
          }
          if (dioError.error is UnAuthenticateException) {
            return const Failure.unAuthenticated();
          }
          return const Failure.serverNotResponse();
      }
    } else {
      return const Failure.unknownFailure();
    }
  }

  // Future<Either<T, Failure>> makeRequest<T>({
  //   required Future<dynamic> call,
  //   required ResponseToModel<T> toModel,
  // }) async {
  //   try {
  //     var response = await call;
  //     return Either.left(toModel.call(response));
  //   } on Exception catch (exception) {
  //     return Either.right(handleError(exception));
  //   }
  // }
}
