part of 'fetch_logistic_cubit.dart';

@immutable
sealed class FetchLogisticState {}

final class FetchLogisticInitial extends FetchLogisticState {}

final class FetchLogisticSuccessState extends FetchLogisticState{
  final List<DropDownElements> logistics;
  FetchLogisticSuccessState({required this.logistics});
}

final class FetchLogisticsFailureState extends FetchLogisticState{
  final String message;
  FetchLogisticsFailureState({required this.message});
}

final class FetchLogisticsLoadingState extends FetchLogisticState{}
