part of 'delete_firm_cubit.dart';

@immutable
sealed class DeleteFirmState {}

final class DeleteFirmInitial extends DeleteFirmState {}

final class DeleteFirmSuccessState extends DeleteFirmState {
  final String message;
  DeleteFirmSuccessState({required this.message});
}

final class DeleteFirmFailureState extends DeleteFirmState{
  final String message;
  DeleteFirmFailureState({required this.message});
}

final class DeleteFirmLoadingState extends DeleteFirmState{}