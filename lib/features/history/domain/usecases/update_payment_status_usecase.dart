import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/history/domain/repository/history_repository.dart';

class UpdatePaymentStatusUsecase
    implements Usecase<String, UpdatePaymentStatusParams> {
  final HistoryRepository historyRepository;
  UpdatePaymentStatusUsecase({required this.historyRepository});
  @override
  Future<Either<Failure, String>> call(UpdatePaymentStatusParams params) async {
    return await historyRepository.markAsPaid(
      invoiceId: params.invoiceId,
    );
  }
}

class UpdatePaymentStatusParams {
  final String invoiceId;
  UpdatePaymentStatusParams({required this.invoiceId});
}
