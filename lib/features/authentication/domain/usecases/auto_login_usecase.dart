import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/authentication/domain/repository/auth_repository.dart';

class AutoLoginUsecase implements Usecase<String?, AutoLoginParams> {
  final AuthRepository authRepository;
  AutoLoginUsecase({required this.authRepository});
  @override
  Future<Either<Failure, String?>> call(AutoLoginParams params) async {
    return await authRepository.autoLogin();
  }
}

class AutoLoginParams {}
