import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/history/domain/repository/history_repository.dart';

class DeleteInvoiceUsecase implements Usecase<String, DeleteInvoiceParams> {
  final HistoryRepository historyRepository;
  DeleteInvoiceUsecase({required this.historyRepository});
  @override
  Future<Either<Failure, String>> call(DeleteInvoiceParams params) async {
    return await historyRepository.deleteInvoice(
      invoiceId: params.invoiceId,
    );
  }
}

class DeleteInvoiceParams {
  final String invoiceId;
  DeleteInvoiceParams({
    required this.invoiceId,
  });
}
