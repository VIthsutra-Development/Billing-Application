import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/authentication/domain/repository/auth_repository.dart';

class RegisterUsecase implements Usecase<String, RegisterParams> {
  final AuthRepository authRepository;
  RegisterUsecase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(RegisterParams params) async {
    return await authRepository.register(
      userName: params.userName,
      email: params.email,
      password: params.password,
      userPhone: params.userPhone,
    );
  }
}

class RegisterParams {
  final String userName;
  final String email;
  final String password;
  final String userPhone;
  RegisterParams({
    required this.userName,
    required this.email,
    required this.password,
    required this.userPhone,
  });
}
