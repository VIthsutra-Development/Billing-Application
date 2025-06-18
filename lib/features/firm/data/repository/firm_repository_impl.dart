import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/firm/data/datasource/firm_local_datasource.dart';
import 'package:new_billing/features/firm/data/datasource/firm_remote_datasource.dart';
import 'package:new_billing/features/firm/data/models/firm_model.dart';
import 'package:new_billing/features/firm/domain/repository/firm_repository.dart';

class FirmRepositoryImpl implements FirmRepository {
  final FirmLocalDataSource firmLocalDataSource;
  final FirmRemoteDataSource firmRemoteDataSource;
  FirmRepositoryImpl({
    required this.firmLocalDataSource,
    required this.firmRemoteDataSource,
  });
  @override
  Future<Either<Failure, String>> addFirm({
    required String firmName,
    required String firmAddress,
    required String firmGstNumber,
    required String firmPhoneNumber,
    required String firmEmail,
    required String firmPan,
    required File? firmLogo,
  }) async {
    try {
      final userId = firmLocalDataSource.getUserId();
      final response = await firmRemoteDataSource.addFirm(
        firmModel: FirmModel(
          firmId: "",
          firmName: firmName,
          firmAddress: firmAddress,
          firmGstNumber: firmGstNumber,
          firmPhoneNumber: firmPhoneNumber,
          firmEmail: firmEmail,
          firmPan: firmPan,
          userId: userId,
          firmLogo: firmLogo!,
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
  Future<Either<Failure, String>> deleteFirm({
    required String firmId,
  }) async {
    try {
      final response = await firmRemoteDataSource.deleteFirm(
        firmId: firmId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } catch (_) {
      return Left(Failure(message: "Exception While Processing The Request"));
    }
  }

  @override
  Future<Either<Failure, List<FirmModel>>> fetchFirms() async {
    try {
      final userId = firmLocalDataSource.getUserId();
      final firms = await firmRemoteDataSource.fetchFirms(userId: userId);
      return Right(firms);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } on LocalStorageException catch (e) {
      return Left(Failure(message: e.message));
    } catch (_) {
      return Left(Failure(message: "Exception While Processing The Request."));
    }
  }
}
