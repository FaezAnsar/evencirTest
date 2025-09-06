// This is for authentication APIs

import 'package:evencir_test/core/data_source/base_remote_data_source.dart';

class AuthRemoteDataSource extends BaseRemoteDataSource {
  // Future<BaseResponse<LogInModel>> loginWithGoogle({
  //   required String token,
  //   required String fcmToken,
  // }) {
  //   return request(
  //     endpoint: ApiEndpoints.googleLogin,
  //     method: RequestType.post,
  //     data: {'token': token, 'fcm_token': fcmToken},
  //     transformer: (data) => LogInModel.fromJson(data as Map<String, dynamic>),
  //   );
  // }

  // Future<BaseResponse<LogInModel>> loginWithApple({
  //   required String token,
  //   required String fcmToken,
  // }) {
  //   return request(
  //     endpoint: ApiEndpoints.appleLogin,
  //     method: RequestType.post,
  //     data: {'token': token, 'fcm_token': fcmToken},
  //     transformer: (data) => LogInModel.fromJson(data as Map<String, dynamic>),
  //   );
  // }

  // Future<BaseResponse<LogInModel>> login({
  //   required String email,
  //   required String password,
  //   required String fcmToken,
  // }) {
  //   return request(
  //     endpoint: ApiEndpoints.login,
  //     method: RequestType.post,
  //     data: {'email': email, 'password': password, 'fcm_token': fcmToken},
  //     transformer: (data) => LogInModel.fromJson(data as Map<String, dynamic>),
  //   );
  // }

  // Future<BaseResponse<RegisterModel>> register({
  //   required String name,
  //   required String email,
  //   required String password,
  // }) {
  //   return request(
  //     endpoint: ApiEndpoints.register,
  //     method: RequestType.post,
  //     data: {'name': name, 'password': password, 'email': email},
  //     transformer:
  //         (data) => RegisterModel.fromJson(data as Map<String, dynamic>),
  //   );
  // }

  // Future<BaseResponse<ApiMessageModel<NoData>>> forgotPassword({
  //   required String email,
  // }) {
  //   return request(
  //     endpoint: ApiEndpoints.forgotPassword,
  //     method: RequestType.post,
  //     data: {'email': email},
  //     transformer:
  //         (data) =>
  //             ApiMessageModel<NoData>.fromJson(data as Map<String, dynamic>),
  //   );
  // }
}
