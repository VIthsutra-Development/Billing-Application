part of 'add_firm_cubit.dart';

@immutable
sealed class AddFirmState {}

final class AddFirmInitial extends AddFirmState {}

final class AddFirmSuccessState extends AddFirmState {
  final String message;
  AddFirmSuccessState({required this.message});
}

final class AddFirmFailureState extends AddFirmState {
  final String message;
  AddFirmFailureState({required this.message});
}

final class AddFirmLoadingState extends AddFirmState{}
