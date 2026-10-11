import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../common/result.dart';
import '../error/failure.dart';
import '../utils/constant_manager.dart';


Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } catch (ex) {
    if (ex is DioException) {
      debugPrint(ex.response?.statusCode.toString());
      debugPrint(ex.response?.data.toString());
      log(ex.message.toString());
      log(ex.error.toString());
      log(ServerFailure.fromDioException(ex).errorMessage);
      return Error(ServerFailure.fromDioException(ex).errorMessage);
    } else if (ex is ServerFailure) {

      log(ex.errorMessage.toString());
      return Error(ServerFailure(errorMessage: ex.errorMessage).errorMessage);
    } else {
      log(ex.toString());

      return Error(ex.toString());
    }
  }
}
