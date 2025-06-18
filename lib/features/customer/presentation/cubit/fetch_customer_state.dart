part of 'fetch_customer_cubit.dart';

@immutable
sealed class FetchCustomerState {}

final class FetchCustomerInitial extends FetchCustomerState {}

final class FetchCustomerSuccessState extends FetchCustomerState {
  final List<CustomerEntity> customers;
  FetchCustomerSuccessState({required this.customers});
}

final class FetchCustomerFailureState extends FetchCustomerState {
  final String message;
  FetchCustomerFailureState({required this.message});
}

final class FetchCustomerLoadingState extends FetchCustomerState{}
