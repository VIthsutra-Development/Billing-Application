import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/logistic/domain/entities/logistic_entity.dart';
import 'package:new_billing/features/logistic/domain/repository/logistic_repository.dart';

class FetchLogisticUsecase
    implements Usecase<List<LogisticEntity>, FetchLogisticParams> {
  final LogisticRepository logisticRepository;
  FetchLogisticUsecase({required this.logisticRepository});
  @override
  Future<Either<Failure, List<LogisticEntity>>> call(
    FetchLogisticParams params,
  ) async {
    return await logisticRepository.fetchLogistics();
  }
}

class FetchLogisticParams {}
