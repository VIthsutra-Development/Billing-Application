import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/firm/domain/entities/firm_entity.dart';
import 'package:new_billing/features/firm/domain/repository/firm_repository.dart';

class FetchFirmUsecase
    implements Usecase<List<FirmEntity>, FetchFirmParams> {
  final FirmRepository firmRepository;
  FetchFirmUsecase({required this.firmRepository});
  @override
  Future<Either<Failure, List<FirmEntity>>> call(
    FetchFirmParams params,
  ) async {
    return await firmRepository.fetchFirms();
  }
}

class FetchFirmParams {}