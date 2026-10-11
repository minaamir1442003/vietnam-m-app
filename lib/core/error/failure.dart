import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  final Map<String, List<String>>? fieldErrors;

  const Failure({
    required this.errorMessage,
    this.fieldErrors,
  });
}

class ServerFailure extends Failure {
  ServerFailure({
    required super.errorMessage,
    super.fieldErrors,
  });

  factory ServerFailure.fromDioException(DioException dioExep) {
    switch (dioExep.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: 'Connection timeout, please try again',
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMessage: 'Request timeout, please try again',
        );

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMessage: 'Response timeout, please try again',
        );

      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage: 'No internet connection',
        );

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioExep);

      case DioExceptionType.cancel:
        return ServerFailure(
          errorMessage: 'Request was cancelled',
        );

      case DioExceptionType.unknown:
      default:
        return ServerFailure(
          errorMessage: 'Unexpected error, please try again',
        );
    }
  }

  factory ServerFailure.fromResponse(DioException dioExep) {
    final response = dioExep.response;

    if (response == null || response.data == null) {
      return ServerFailure(
        errorMessage: 'Something went wrong',
      );
    }

    final data = response.data;

    final message = data['message'];
    final errors = data['errors'];

    if (errors != null && errors is Map<String, dynamic>) {
      return ServerFailure(
        errorMessage: message ?? 'Validation error',
        fieldErrors: errors.map(
              (key, value) => MapEntry(
            key,
            List<String>.from(value),
          ),
        ),
      );
    }

    if (message is String) {
      return ServerFailure(
        errorMessage: message,
      );
    }

    return ServerFailure(
      errorMessage: 'Something went wrong',
    );
  }
}
