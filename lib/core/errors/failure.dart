import 'package:dio/dio.dart';

class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Server is not responding');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response?.data,
        );
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'No internet connection');
      default:
        return ServerFailure(errMessage: 'Unexpected error occurred');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic data) {
    if (statusCode == 404) {
      return ServerFailure(errMessage: 'Resource not found');
    } else if (statusCode == 401) {
      return ServerFailure(errMessage: 'Unauthorized');
    } else if (statusCode >= 500) {
      return ServerFailure(errMessage: 'Server error, try again later');
    } else {
      return ServerFailure(
        errMessage: data?['message'] ?? 'Something went wrong',
      );
    }
  }
}
