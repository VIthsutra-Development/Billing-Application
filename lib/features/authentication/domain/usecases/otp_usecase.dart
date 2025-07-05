import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/authentication/domain/repository/auth_repository.dart';

class OtpUsecase implements Usecase<String, OtpParams> {
  final AuthRepository authRepository;

  OtpUsecase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(OtpParams params) async {
    return await authRepository.validateOtp(otp: params.otp);
  }
}

class OtpParams {
  final String otp;

  OtpParams({required this.otp});
}
