import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/history/data/datasource/history_local_data_source.dart';
import 'package:new_billing/features/history/data/datasource/history_remote_data_source.dart';
import 'package:new_billing/features/history/domain/entities/history_entity.dart';
import 'package:new_billing/features/history/domain/repository/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryRemoteDataSource historyRemoteDataSource;
  final HistoryLocalDataSource historyLocalDataSource;
  HistoryRepositoryImpl({
    required this.historyLocalDataSource,
    required this.historyRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<HistoryEntity>>> getInvoices() async {
    try {
      final userId = historyLocalDataSource.getUserId();
      final history = await historyRemoteDataSource.getInvoices(userId: userId);
      return Right(history);
    } on LocalStorageException catch (e) {
      return Left(Failure(message: e.message));
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure(message: "Exception while Processing the Request."));
    }
  }

  @override
  Future<Either<Failure, String>> markAsPaid({
    required String invoiceId,
  }) async {
    try {
      final statusMessage =
          await historyRemoteDataSource.markAsPaid(invoiceId: invoiceId);
      return Right(statusMessage);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(
        Failure(
          message: "Exception while Processing the Request.",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> deleteInvoice(
      {required String invoiceId}) async {
    try {
      final response = await historyRemoteDataSource.deleteInvoice(
        invoiceId: invoiceId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure(message: "Exception while Processing the Request."));
    }
  }
}
