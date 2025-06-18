part of 'fetch_customer_cubit.dart';

@immutable
sealed class FetchCustomerState {}

final class FetchCustomerInitial extends FetchCustomerState {}

final class FetchCustomersSuccessState extends FetchCustomerState {
  final List<DropDownElements> customers;
  FetchCustomersSuccessState({required this.customers});
}

final class FetchCustomersFailureState extends FetchCustomerState {
  final String message;
  FetchCustomersFailureState({required this.message});
}

final class FetchCustomersLoadingState extends FetchCustomerState {}
