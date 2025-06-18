part of 'logout_cubit_cubit.dart';

@immutable
sealed class LogoutCubitState {}

final class LogoutCubitInitial extends LogoutCubitState {}

final class LogoutSuccessState extends LogoutCubitState{}

final class LogoutFailureState extends LogoutCubitState{}
