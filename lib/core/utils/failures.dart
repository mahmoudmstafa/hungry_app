import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection time out');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send time out');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive time out');

      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Certificate was bad !');

      case DioExceptionType.badResponse:
        final data = dioError.response?.data;
        final statusCode = dioError.response?.statusCode;
        if (data != null && statusCode != null) {
          return ServerFailure.fromResponse(statusCode, data);
        } else {
          return ServerFailure(errMessage: 'Unexpected server response .');
        }
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Order has been cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'No internet connection !');

      case DioExceptionType.unknown:
        return ServerFailure(
          errMessage: 'Error was unknown , Please try again !',
        );
      case DioExceptionType.transformTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  factory ServerFailure.fromResponse(int statusCode, response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        // this code maybe change because of api
        errMessage: response['error']?['message'] is Map
            ? response['error']['message'] ?? 'Something went wrong !'
            : 'Something went wrong !',
      );
    } else if (statusCode == 404) {
      return ServerFailure(errMessage: 'Request was not found ! Try later .');
    } else if (statusCode == 500) {
      return ServerFailure(errMessage: 'Internal Server Error ! Try later .');
    } else {
      return ServerFailure(
        errMessage: 'Ops there was an error ! Please try again .',
      );
    }
  }
}

class FirebaseFailure extends Failure {
  FirebaseFailure({
    required super.errMessage,
  });

  factory FirebaseFailure.fromLoginException(
    FirebaseAuthException exception,
  ) {
    switch (exception.code) {
      case 'invalid-email':
        return FirebaseFailure(
          errMessage: 'Please enter a valid email address.',
        );

      case 'invalid-credential':
        return FirebaseFailure(
          errMessage: 'Invalid email or password.',
        );

      case 'user-not-found':
        return FirebaseFailure(
          errMessage: 'No account found with this email.',
        );

      case 'wrong-password':
        return FirebaseFailure(
          errMessage: 'Incorrect password.',
        );

      case 'user-disabled':
        return FirebaseFailure(
          errMessage: 'This account has been disabled.',
        );

      case 'too-many-requests':
        return FirebaseFailure(
          errMessage: 'Too many login attempts. Please try again later.',
        );

      case 'network-request-failed':
        return FirebaseFailure(
          errMessage: 'Please check your internet connection.',
        );

      default:
        return FirebaseFailure(
          errMessage: exception.message ?? 'Login failed. Please try again.',
        );
    }
  }

  factory FirebaseFailure.fromSignUpException(
    FirebaseAuthException exception,
  ) {
    switch (exception.code) {
      case 'email-already-in-use':
        return FirebaseFailure(
          errMessage: 'This email is already in use.',
        );

      case 'invalid-email':
        return FirebaseFailure(
          errMessage: 'Please enter a valid email.',
        );

      case 'weak-password':
        return FirebaseFailure(
          errMessage: 'Weak Password .',
        );

      case 'user-not-found':
        return FirebaseFailure(
          errMessage: 'No user found with this email.',
        );

      case 'wrong-password':
        return FirebaseFailure(
          errMessage: 'Incorrect password.',
        );

      case 'invalid-credential':
        return FirebaseFailure(
          errMessage: 'Invalid email or password.',
        );

      case 'too-many-requests':
        return FirebaseFailure(
          errMessage: 'Too many attempts. Please try again later.',
        );

      case 'network-request-failed':
        return FirebaseFailure(
          errMessage: 'Please check your internet connection.',
        );

      case 'user-disabled':
        return FirebaseFailure(
          errMessage: 'This account has been disabled.',
        );

      default:
        return FirebaseFailure(
          errMessage:
              exception.message ?? 'Authentication failed. Please try again.',
        );
    }
  }
}
