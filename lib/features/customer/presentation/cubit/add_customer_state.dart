part of 'add_customer_cubit.dart';

@immutable
sealed class AddCustomerState {}

final class AddCustomerInitial extends AddCustomerState {}

final class AddCustomerSuccessState extends AddCustomerState {
  final String message;
  AddCustomerSuccessState({required this.message});
}

final class AddCustomerFailureState extends AddCustomerState {
  final String message;
  AddCustomerFailureState({required this.message});
}

final class AddCustomerLoadingState extends AddCustomerState {}
