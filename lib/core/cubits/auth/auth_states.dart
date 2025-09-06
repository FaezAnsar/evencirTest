import 'package:evencir_test/core/models/user_model.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthAuthorized extends AuthState {
  const AuthAuthorized({required this.user});

  final UserModel user;
}

class AuthUnauthorized extends AuthState {}

class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;
}
