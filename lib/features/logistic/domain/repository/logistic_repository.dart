import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/logistic/domain/entities/logistic_entity.dart';

abstract interface class LogisticRepository {
  Future<Either<Failure, List<LogisticEntity>>> fetchLogistics();
  Future<Either<Failure, String>> addLogistic({
    required String logisticName,
    required String logisticAddress,
    required String logisticGstNumber,
    required String logisticPhoneNumber,
    required String logisticState,
    required String logisticStateCode,
  });
  Future<Either<Failure, String>> deleteLogistic({
    required String logisticId,
  });
}
