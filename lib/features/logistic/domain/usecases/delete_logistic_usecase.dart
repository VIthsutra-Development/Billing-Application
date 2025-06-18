import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/logistic/domain/repository/logistic_repository.dart';

class DeleteLogisticUsecase implements Usecase<String, DeleteLogisticParams> {
  final LogisticRepository logisticRepository;
  DeleteLogisticUsecase({required this.logisticRepository});
  @override
  Future<Either<Failure, String>> call(DeleteLogisticParams params) async {
    return await logisticRepository.deleteLogistic(
      logisticId: params.logisticId,
    );
  }
}

class DeleteLogisticParams {
  final String logisticId;
  DeleteLogisticParams({required this.logisticId});
}
