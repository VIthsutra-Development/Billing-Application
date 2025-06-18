import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/authentication/domain/repository/auth_repository.dart';

class LoginUsecase implements Usecase<String, LoginParams> {
  final AuthRepository authRepository;
  LoginUsecase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(LoginParams params) async {
    return await authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({
    required this.email,
    required this.password,
  });
}
