part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;
  AuthLoginEvent({required this.email, required this.password});
}

final class AuthRegisterEvent extends AuthEvent {
  final String userName;
  final String email;
  final String password;
  final String userPhone;
  AuthRegisterEvent(
      {required this.userName,
      required this.email,
      required this.password,
      required this.userPhone});
}

final class AuthForgotPassEvent extends AuthEvent {
  final String email;
  AuthForgotPassEvent({required this.email});
}

final class AuthOtpEvent extends AuthEvent {
  final String otp;
  AuthOtpEvent({required this.otp});
}
