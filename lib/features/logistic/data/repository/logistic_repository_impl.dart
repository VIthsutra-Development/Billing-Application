import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/logistic/data/datasource/logistic_local_data_source.dart';
import 'package:new_billing/features/logistic/data/datasource/logistic_remote_data_source.dart';
import 'package:new_billing/features/logistic/data/models/logistic_model.dart';
import 'package:new_billing/features/logistic/domain/repository/logistic_repository.dart';

class LogisticRepositoryImpl implements LogisticRepository {
  final LogisticLocalDataSource logisticLocalDataSource;
  final LogisticRemoteDataSource logisticRemoteDataSource;
  LogisticRepositoryImpl({
    required this.logisticLocalDataSource,
    required this.logisticRemoteDataSource,
  });
  @override
  Future<Either<Failure, String>> addLogistic({
    required String logisticName,
    required String logisticAddress,
    required String logisticGstNumber,
    required String logisticPhoneNumber,
    required String logisticState,
    required String logisticStateCode,
  }) async {
    try {
      final userId = logisticLocalDataSource.getUserId();
      final response = await logisticRemoteDataSource.addLogistic(
        logisticModel: LogisticModel(
          logisticId: "",
          logisticName: logisticName,
          logisticAddress: logisticAddress,
          logisticGstNumber: logisticGstNumber,
          logisticPhoneNumber: logisticPhoneNumber,
          logisticState: logisticState,
          logisticStateCode: logisticStateCode,
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
  Future<Either<Failure, String>> deleteLogistic({
    required String logisticId,
  }) async {
    try {
      final response = await logisticRemoteDataSource.deleteLogistic(
        logisticId: logisticId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } catch (_) {
      return Left(Failure(message: "Exception While Processing The Request"));
    }
  }

  @override
  Future<Either<Failure, List<LogisticModel>>> fetchLogistics() async {
    try {
      final userId = logisticLocalDataSource.getUserId();
      final logistics =
          await logisticRemoteDataSource.fetchLogistics(userId: userId);
      return Right(logistics);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } on LocalStorageException catch (e) {
      return Left(Failure(message: e.message));
    } catch (_) {
      return Left(Failure(message: "Exception While Processing The Request."));
    }
  }
}
