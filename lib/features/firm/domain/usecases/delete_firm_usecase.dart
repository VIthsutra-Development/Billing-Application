import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/firm/domain/repository/firm_repository.dart';

class DeleteFirmUsecase implements Usecase<String, DeleteFirmParams> {
  final FirmRepository firmRepository;
  DeleteFirmUsecase({required this.firmRepository});
  @override
  Future<Either<Failure, String>> call(DeleteFirmParams params) async {
    return await firmRepository.deleteFirm(
      firmId: params.firmId,
    );
  }
}

class DeleteFirmParams {
  final String firmId;
  DeleteFirmParams({required this.firmId});
}
