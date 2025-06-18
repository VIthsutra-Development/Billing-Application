part of 'fetch_firm_cubit.dart';

@immutable
sealed class FetchFirmState {}

final class FetchFirmInitial extends FetchFirmState {}

final class FetchFirmSuccessState extends FetchFirmState{
  final List<DropDownElements> firms;
  FetchFirmSuccessState({required this.firms});
}

final class FetchFirmFailureState extends FetchFirmState{
  final String message;
  FetchFirmFailureState({required this.message});
}

final class FetchFirmLoadingState extends FetchFirmState{}
