import 'dart:async';
import 'dart:developer';

import 'package:evencir_test/core/api/api_state.dart';
import 'package:evencir_test/core/data_source/base_remote_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppApiCubit<T> extends Cubit<ApiState<T>> {
  AppApiCubit() : super(const ApiInitialState());

  Future<BaseResponse<T?>?> call(
    Future<BaseResponse<T?>> Function() caller, {
    void Function()? onSuccess,
    void Function()? onError,
  }) async {
    try {
      if (state is ApiLoadingState) return null;
      emitLoading();
      final response = await caller.call();

      response.fold(
        (error) {
          log('Error Response: $error', name: 'ApiCubit');
          emitError(message: error.message, errorCode: error.statusCode);
          onError?.call();
        },
        (data) {
          if (data != null) {
            emitLoaded(data: data, statusCode: 200);
            onSuccess?.call();
          } else {
            emitError(message: 'Data is null');
            onError?.call();
          }
        },
      );

      return response;
    } catch (error) {
      if (error is TimeoutException) {
        log('Timeout Error: ${error.message}', name: 'ApiCubit');
        emitError(message: 'Request timed out. Please try again later.');
      } else if (error is Error) {
        log('Error: $error ${error.stackTrace}', name: 'ApiCubit');
      } else if (error is Exception) {
        log('Exception: ${error.toString()}', name: 'ApiCubit');
        emitError(message: error.toString());
      } else {
        log('Unknown Error: $error', name: 'ApiCubit');
        emitError(message: 'An unknown error occurred.');
      }
      emitError(message: error.toString());
    }
    return null;
  }

  void emitLoading() {
    emit(const ApiLoadingState());
  }

  void emitError({required String message, int? errorCode}) {
    emit(ApiErrorState(error: message, statusCode: errorCode));
  }

  void emitLoaded({required T data, required int statusCode}) {
    emit(ApiLoadedState(data: data, statusCode: statusCode));
  }
}
