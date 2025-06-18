part of 'fetch_logistic_cubit.dart';

@immutable
sealed class FetchLogisticState {}

final class FetchLogisticInitial extends FetchLogisticState {}

final class FetchLogisticSuccessState extends FetchLogisticState {
  final List<LogisticEntity> logistic;
  FetchLogisticSuccessState({required this.logistic});
}

final class FetchLogisticFailureState extends FetchLogisticState {
  final String message;
  FetchLogisticFailureState({required this.message});
}

final class FetchLogisticLoadingState extends FetchLogisticState{}
