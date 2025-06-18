import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/bank/data/datasource/bank_local_datasource.dart';
import 'package:new_billing/features/bank/data/datasource/bank_remote_datasource.dart';
import 'package:new_billing/features/bank/data/models/bank_model.dart';
import 'package:new_billing/features/bank/domain/repository/bank_repository.dart';

class BankRepositoryImpl implements BankRepository {
  final BankLocalDataSource bankLocalDataSource;
  final BankRemoteDataSource bankRemoteDataSource;
  BankRepositoryImpl({
    required this.bankLocalDataSource,
    required this.bankRemoteDataSource,
  });
  @override
  Future<Either<Failure, String>> addBank({
    required String bankName,
    required String bankAccountNumber,
    required String bankAccountHolderName,
    required String bankIfscCode,
    required String bankBranchName,
  }) async {
    try {
      final userId = bankLocalDataSource.getUserId();
      final response = await bankRemoteDataSource.addBank(
        bankModel: BankModel(
          bankId: "",
          bankName: bankName,
          bankAccountNumber: bankAccountNumber,
          bankIfscCode: bankIfscCode,
          bankBranchName: bankBranchName,
          bankAccountHolderName: bankAccountHolderName,
          userId: userId,
        ),
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } on LocalStorageException catch (e) {
      return Left(Failure(message: e.message));
    } catch (_) {
      return Left(Failure(message: "Exception While Processing The Request."));
    }
  }

  @override
  Future<Either<Failure, String>> deleteBank({
    required String bankId,
  }) async {
    try {
      final response = await bankRemoteDataSource.deleteBank(
        bankId: bankId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } catch (_) {
      return Left(Failure(message: "Exception While Processing The Request"));
    }
  }

  @override
  Future<Either<Failure, List<BankModel>>> fetchBanks() async {
    try {
      final userId = bankLocalDataSource.getUserId();
      final banks = await bankRemoteDataSource.fetchBanks(userId: userId);
      return Right(banks);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } on LocalStorageException catch (e) {
      return Left(Failure(message: e.message));
    } catch (_) {
      return Left(Failure(message: "Exception While Processing The Request."));
    }
  }
}
