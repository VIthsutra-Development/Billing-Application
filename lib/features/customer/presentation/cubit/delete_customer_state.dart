part of 'delete_customer_cubit.dart';

@immutable
sealed class DeleteCustomerState {}

final class DeleteCustomerInitial extends DeleteCustomerState {}

final class DeleteCustomerSuccessState extends DeleteCustomerState {
  final String message;
  DeleteCustomerSuccessState({required this.message});
}

final class DeleteCustomerFailureState extends DeleteCustomerState{
  final String message;
  DeleteCustomerFailureState({required this.message});
}

final class DeleteCustomerLoadingState extends DeleteCustomerState{}
