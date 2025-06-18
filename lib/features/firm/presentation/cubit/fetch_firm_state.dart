part of 'fetch_firm_cubit.dart';

@immutable
sealed class FetchFirmState {}

final class FetchFirmInitial extends FetchFirmState {}

final class FetchFirmSuccessState extends FetchFirmState {
  final List<FirmEntity> firm;
  FetchFirmSuccessState({required this.firm});
}

final class FetchFirmFailureState extends FetchFirmState {
  final String message;
  FetchFirmFailureState({required this.message});
}

final class FetchFirmLoadingState extends FetchFirmState{}
