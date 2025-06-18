part of 'delete_logistic_cubit.dart';

@immutable
sealed class DeleteLogisticState {}

final class DeleteLogisticInitial extends DeleteLogisticState {}

final class DeleteLogisticSuccessState extends DeleteLogisticState {
  final String message;
  DeleteLogisticSuccessState({required this.message});
}

final class DeleteLogisticFailureState extends DeleteLogisticState{
  final String message;
  DeleteLogisticFailureState({required this.message});
}

final class DeleteLogisticLoadingState extends DeleteLogisticState{}
