part of 'submit_invoice_cubit.dart';

@immutable
sealed class SubmitInvoiceState {}

final class SubmitInvoiceInitial extends SubmitInvoiceState {}

final class SubmitInvoiceSuccessState extends SubmitInvoiceState{}

final class SubmitInvoiceFailureState extends SubmitInvoiceState{
  final String message;
  SubmitInvoiceFailureState({required this.message});
}

final class SubmitInvoiceLoadingState extends SubmitInvoiceState{}
