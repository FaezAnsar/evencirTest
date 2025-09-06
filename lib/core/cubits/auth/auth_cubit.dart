import 'package:evencir_test/core/cubits/auth/auth_states.dart';
import 'package:evencir_test/core/data_source/storage_local_data_source.dart';
import 'package:evencir_test/core/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.localStorageClient) : super(AuthInitial());

  StorageLocalDataSource localStorageClient;

  void initialize() {
    String? token = getCurrentToken();
    final user = localStorageClient.user.get();
    if (token != null && user != null) {
      authorizeUser(token: token, user: user);
    } else {
      unAuthorizeUser();
    }
  }

  void authorizeUser({required String token, required UserModel user}) {
    localStorageClient.userToken.save(token);
    localStorageClient.user.save(user);
    emit(AuthAuthorized(user: user));
  }

  void unAuthorizeUser() {
    localStorageClient.userToken.delete();
    localStorageClient.user.delete();
    emit(AuthUnauthorized());
  }

  String? getCurrentToken() {
    return localStorageClient.userToken.get();
  }

  UserModel? getCurrentUser() {
    if (state is AuthAuthorized) {
      return (state as AuthAuthorized).user;
    }
    return null;
  }

  void updateUserProfile(UserModel updatedUser) {
    if (state is AuthAuthorized) {
      final currentToken = getCurrentToken();
      if (currentToken != null) {
        localStorageClient.user.save(updatedUser);
        emit(AuthAuthorized(user: updatedUser));
      }
    }
  }
}
