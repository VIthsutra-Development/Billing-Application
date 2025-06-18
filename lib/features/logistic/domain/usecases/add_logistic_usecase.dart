import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/logistic/domain/repository/logistic_repository.dart';

class AddLogisticUsecase implements Usecase<String, AddLogisticParams> {
  final LogisticRepository logisticRepository;
  AddLogisticUsecase({required this.logisticRepository});
  @override
  Future<Either<Failure, String>> call(AddLogisticParams params) async {
    return await logisticRepository.addLogistic(
      logisticName: params.logisticName,
      logisticAddress: params.logisticAddress,
      logisticGstNumber: params.logisticGstNumber,
      logisticPhoneNumber: params.logisticPhoneNumber,
      logisticState: params.logisticState,
      logisticStateCode: params.logisticStateCode,
    );
  }
}

class AddLogisticParams {
  final String logisticName;
  final String logisticAddress;
  final String logisticGstNumber;
  final String logisticPhoneNumber;
  final String logisticState;
  final String logisticStateCode;
  AddLogisticParams({
    required this.logisticAddress,
    required this.logisticGstNumber,
    required this.logisticName,
    required this.logisticPhoneNumber,
    required this.logisticState,
    required this.logisticStateCode,
  });
}
