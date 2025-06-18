part of 'add_logistic_cubit.dart';

@immutable
sealed class AddLogisticState {}

final class AddLogisticInitial extends AddLogisticState {}

final class AddLogisticSuccessState extends AddLogisticState {
  final String message;
  AddLogisticSuccessState({required this.message});
}

final class AddLogisticFailureState extends AddLogisticState {
  final String message;
  AddLogisticFailureState({required this.message});
}

final class AddLogisticLoadingState extends AddLogisticState{}
