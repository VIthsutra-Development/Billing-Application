part of 'add_bank_cubit.dart';

@immutable
sealed class AddBankState {}

final class AddBankInitial extends AddBankState {}

final class AddBankSuccessState extends AddBankState {
  final String message;
  AddBankSuccessState({required this.message});
}

final class AddBankFailureState extends AddBankState {
  final String message;
  AddBankFailureState({required this.message});
}

final class AddBankLoadingState extends AddBankState{}