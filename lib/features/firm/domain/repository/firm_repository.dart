import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/firm/domain/entities/firm_entity.dart';

abstract interface class FirmRepository {
  Future<Either<Failure, List<FirmEntity>>> fetchFirms();
  Future<Either<Failure, String>> addFirm({
    required String firmName,
    required String firmAddress,
    required String firmGstNumber,
    required String firmPhoneNumber,
    required String firmEmail,
    required String firmPan,
    required File? firmLogo,
  });
  Future<Either<Failure, String>> deleteFirm({
    required String firmId,
  });
}