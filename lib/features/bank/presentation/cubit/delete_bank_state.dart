part of 'delete_bank_cubit.dart';

@immutable
sealed class DeleteBankState {}

final class DeleteBankInitial extends DeleteBankState {}

final class DeleteBankSuccessState extends DeleteBankState {
  final String message;
  DeleteBankSuccessState({required this.message});
}

final class DeleteBankFailureState extends DeleteBankState{
  final String message;
  DeleteBankFailureState({required this.message});
}

final class DeleteBankLoadingState extends DeleteBankState{}