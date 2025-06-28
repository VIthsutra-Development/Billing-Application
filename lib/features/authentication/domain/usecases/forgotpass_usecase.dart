import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/authentication/domain/repository/auth_repository.dart';

class ForgotPassUsecase implements Usecase<String, ForgotPassParams> {
  final AuthRepository authRepository;

  ForgotPassUsecase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(params) async {
    return await authRepository.forgotPass(email: params.email);
  }
}

class ForgotPassParams {
  final String email;

  ForgotPassParams({required this.email});
}
