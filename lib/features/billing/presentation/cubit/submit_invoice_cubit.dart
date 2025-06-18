import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/billing/domain/usecases/submit_invoice_usecase.dart';

part 'submit_invoice_state.dart';

class SubmitInvoiceCubit extends Cubit<SubmitInvoiceState> {
  final SubmitInvoiceUsecases _submitInvoiceUsecase;
  SubmitInvoiceCubit({required SubmitInvoiceUsecases submitInvoiceUsecase})
      : _submitInvoiceUsecase = submitInvoiceUsecase,
        super(SubmitInvoiceInitial());

  Future<void> submitInvoice({
    required String bankId,
    required String challanNumber,
    required String customerId,
    required String vehicleNumber,
    required String dateOfSupply,
    required String firmId,
    required String invoiceName,
    required String invoiceNumber,
    required String logisticId,
    required String placeOfSupply,
    required String reverseCharge,
    required String state,
    required String stateCode,
  }) async {
    emit(SubmitInvoiceLoadingState());
    final response = await _submitInvoiceUsecase(
      SubmitInvoiceParams(
        bankId: bankId,
        challanNumber: challanNumber,
        customerId: customerId,
        dateOfSupply: dateOfSupply,
        firmId: firmId,
        invoiceName: invoiceName,
        invoiceNumber: invoiceNumber,
        logisticId: logisticId,
        placeOfSupply: placeOfSupply,
        reverseCharge: reverseCharge,
        state: state,
        stateCode: stateCode,
        vehicleNumber: vehicleNumber,
      ),
    );
    response.fold(
      (failure) {
        emit(
          SubmitInvoiceFailureState(
            message: failure.message,
          ),
        );
      },
      (success) {
        emit(
          SubmitInvoiceSuccessState(),
        );
      },
    );
  }
}
