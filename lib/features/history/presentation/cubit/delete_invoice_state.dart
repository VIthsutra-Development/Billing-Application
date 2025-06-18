part of 'delete_invoice_cubit.dart';

@immutable
sealed class DeleteInvoiceState {}

final class DeleteInvoiceInitial extends DeleteInvoiceState {}

final class DeleteInvoiceSuccessState extends DeleteInvoiceState {
  final String message;
  DeleteInvoiceSuccessState({required this.message});
}

final class DeleteInvoiceFailureState extends DeleteInvoiceState {
  final String message;
  DeleteInvoiceFailureState({required this.message});
}

final class DeleteInvoiceLoadingState extends DeleteInvoiceState {}
