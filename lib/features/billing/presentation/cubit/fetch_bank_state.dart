part of 'fetch_bank_cubit.dart';

@immutable
sealed class FetchBankState {}

final class FetchBankInitial extends FetchBankState {}

final class FetchBankSuccessState extends FetchBankState {
  final List<DropDownElements> banks;
  FetchBankSuccessState({required this.banks});
}

final class FetchBankFailureState extends FetchBankState {
  final String message;
  FetchBankFailureState({required this.message});
}

final class FetchBankLoadingState extends FetchBankState {}
