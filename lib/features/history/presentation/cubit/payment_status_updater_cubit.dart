import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/history/domain/usecases/update_payment_status_usecase.dart';

part 'payment_status_updater_state.dart';

class PaymentStatusUpdaterCubit extends Cubit<PaymentStatusUpdaterState> {
  final UpdatePaymentStatusUsecase _updatePaymentStatusUsecase;
  PaymentStatusUpdaterCubit({
    required UpdatePaymentStatusUsecase updatePaymentStatusUsecase,
  })  : _updatePaymentStatusUsecase = updatePaymentStatusUsecase,
        super(PaymentStatusUpdaterInitial());

  Future<void> updatePaymentStatus({required String invoiceId}) async {
    emit(PaymentStatusUpdateLoadingState());
    final response =
        await _updatePaymentStatusUsecase(UpdatePaymentStatusParams(
      invoiceId: invoiceId,
    ));
    response.fold((failure) {
      emit(PaymentStatusUpdateFailureState(message: failure.message));
    }, (success) {
      emit(PaymentStatusUpdateSuccessState(message: success));
    });
  }
}
