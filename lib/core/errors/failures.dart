import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;
  Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate");
      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode ?? 0;
        final data = dioException.response?.data;
        return ServerFailure.fromResponse(statusCode, data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was Cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure("Connection Error with ApiServer");
      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') == true) {
          return ServerFailure('No Internet Connection');
        }
        if (dioException.message?.contains('HandshakeException') == true) {
          return ServerFailure('SSL Handshake failed');
        } else {
          return ServerFailure("Unexpected Error, please try again!");
        }
      }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 0 ||
        response == null ||
        (response is Map && response.isEmpty)) {
      return ServerFailure('Empty Response, Please try again!');
    }
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request Not Found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, Please try later!');
    } else {
      return ServerFailure('Opps, There was an Error, Please try later!');
    }
  }
}
