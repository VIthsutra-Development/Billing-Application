part of 'payment_status_updater_cubit.dart';

@immutable
sealed class PaymentStatusUpdaterState {}

final class PaymentStatusUpdaterInitial extends PaymentStatusUpdaterState {}

final class PaymentStatusUpdateSuccessState extends PaymentStatusUpdaterState {
  final String message;
  PaymentStatusUpdateSuccessState({
    required this.message,
  });
}

final class PaymentStatusUpdateFailureState extends PaymentStatusUpdaterState {
  final String message;
  PaymentStatusUpdateFailureState({
    required this.message,
  });
}

final class PaymentStatusUpdateLoadingState extends PaymentStatusUpdaterState{}
