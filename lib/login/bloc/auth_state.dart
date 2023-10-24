part of 'auth_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel token;
  LoginSuccess(this.token);
}

class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}
