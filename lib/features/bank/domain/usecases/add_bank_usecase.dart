import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/bank/domain/repository/bank_repository.dart';

class AddBankUsecase implements Usecase<String, AddBankParams> {
  final BankRepository bankRepository;
  AddBankUsecase({required this.bankRepository});
  @override
  Future<Either<Failure, String>> call(AddBankParams params) async {
    return await bankRepository.addBank(
      bankName: params.bankName,
      bankAccountNumber: params.bankAccountNumber,
      bankAccountHolderName: params.bankAccountHolderName,
      bankBranchName: params.bankBranchName,
      bankIfscCode: params.bankIfscCode,
    );
  }
}

class AddBankParams {
  final String bankName;
  final String bankAccountNumber;
  final String bankIfscCode;
  final String bankAccountHolderName;
  final String bankBranchName;
  AddBankParams({
    required this.bankAccountHolderName,
    required this.bankAccountNumber,
    required this.bankName,
    required this.bankBranchName,
    required this.bankIfscCode,
  });
}
