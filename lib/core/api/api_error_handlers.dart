import 'dart:developer' show log;

import 'package:dio/dio.dart';
import 'package:evencir_test/core/api/api_exception.dart';
import 'package:evencir_test/core/utils/helpers.dart';
import 'package:fpdart/fpdart.dart';

mixin ApiErrorHandlers {
  Either<ApiException, T> handleDioException<T>(DioException e) {
    log('ApiException: ${e.response?.data}', name: 'ApiErrorHandlers');

    return left(
      ApiException(
        url: e.requestOptions.path,
        message: (e.response?.data['message'] as String?) ?? 'Unknown error',
        response: e.response,
        statusCode: e.response?.statusCode,
      ),
    );
  }

  Either<ApiException, T> redirectUnauthenticatedHandler<T>(DioException e) {
    if (e.response?.statusCode == 401) {
      // AuthManager.instance.destroySession();
      // locator<AuthCubit>().unAuthorizeUser();
      displayToastMessage('Unauthorized, please login again');

      return left(
        ApiException(
          url: e.requestOptions.path,
          message: 'Unauthorized, please login again',
          response: e.response,
          statusCode: e.response?.statusCode,
        ),
      );
    } else {
      return handleDioException(e);
    }
  }
}
