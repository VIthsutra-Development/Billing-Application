import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/bank/domain/entities/bank_entity.dart';
import 'package:new_billing/features/bank/domain/repository/bank_repository.dart';

class FetchBankUsecase
    implements Usecase<List<BankEntity>, FetchBankParams> {
  final BankRepository bankRepository;
  FetchBankUsecase({required this.bankRepository});
  @override
  Future<Either<Failure, List<BankEntity>>> call(
    FetchBankParams params,
  ) async {
    return await bankRepository.fetchBanks();
  }
}

class FetchBankParams {}