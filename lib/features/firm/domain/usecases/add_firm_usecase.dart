import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/firm/domain/repository/firm_repository.dart';

class AddFirmUsecase implements Usecase<String, AddFirmParams> {
  final FirmRepository firmRepository;
  AddFirmUsecase({required this.firmRepository});
  @override
  Future<Either<Failure, String>> call(AddFirmParams params) async {
    return await firmRepository.addFirm(
      firmName: params.firmName,
      firmAddress: params.firmAddress,
      firmGstNumber: params.firmGstNumber,
      firmPhoneNumber: params.firmPhoneNumber,
      firmEmail: params.firmEmail,
      firmLogo: params.firmLogo,
      firmPan: params.firmPan,
    );
  }
}

class AddFirmParams {
  final String firmName;
  final String firmAddress;
  final String firmGstNumber;
  final String firmPhoneNumber;
  final String firmEmail;
  final String firmPan;
  final File firmLogo;
  AddFirmParams({
    required this.firmAddress,
    required this.firmGstNumber,
    required this.firmName,
    required this.firmPhoneNumber,
    required this.firmEmail,
    required this.firmLogo,
    required this.firmPan,
  });
}
