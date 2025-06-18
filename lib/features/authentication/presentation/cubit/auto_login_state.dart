part of 'auto_login_cubit.dart';

@immutable
sealed class AutoLoginState {}

final class AutoLoginInitial extends AutoLoginState {}

final class AutoLoginSuccessState extends AutoLoginState {
  final String? token;
  AutoLoginSuccessState({required this.token});
}

final class AutoLoginFailureState extends AutoLoginState {}
