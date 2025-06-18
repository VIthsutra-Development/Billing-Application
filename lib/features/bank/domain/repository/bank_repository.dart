import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/bank/domain/entities/bank_entity.dart';

abstract interface class BankRepository {
  Future<Either<Failure, List<BankEntity>>> fetchBanks();
  Future<Either<Failure, String>> addBank({
    required String bankName,
    required String bankAccountNumber,
    required String bankIfscCode,
    required String bankBranchName,
    required String bankAccountHolderName,
  });
  Future<Either<Failure, String>> deleteBank({
    required String bankId,
  });
}
