import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/bank/domain/repository/bank_repository.dart';

class DeleteBankUsecase implements Usecase<String, DeleteBankParams> {
  final BankRepository bankRepository;
  DeleteBankUsecase({required this.bankRepository});
  @override
  Future<Either<Failure, String>> call(DeleteBankParams params) async {
    return await bankRepository.deleteBank(
      bankId: params.bankId,
    );
  }
}

class DeleteBankParams {
  final String bankId;
  DeleteBankParams({required this.bankId});
}
