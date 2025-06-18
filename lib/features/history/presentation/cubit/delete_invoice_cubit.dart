import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/features/history/domain/usecases/delete_invoice_usecase.dart';

part 'delete_invoice_state.dart';

class DeleteInvoiceCubit extends Cubit<DeleteInvoiceState> {
  final DeleteInvoiceUsecase _deleteInvoiceUsecase;
  DeleteInvoiceCubit({
    required DeleteInvoiceUsecase deleteInvoiceUsecase,
  })  : _deleteInvoiceUsecase = deleteInvoiceUsecase,
        super(
          DeleteInvoiceInitial(),
        );
  Future<void> deleteInvoice({
    required String invoiceId,
  }) async {
    emit(DeleteInvoiceLoadingState());
    final response = await _deleteInvoiceUsecase(
      DeleteInvoiceParams(
        invoiceId: invoiceId,
      ),
    );
    response.fold(
      (failure) {
        emit(DeleteInvoiceFailureState(message: failure.message));
      },
      (success) {
        emit(DeleteInvoiceSuccessState(message: success));
      },
    );
  }
}
