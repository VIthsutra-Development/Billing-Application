import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/home/domain/repository/home_repository.dart';

class LogoutUsecase implements Usecase<String, LogoutParams> {
  final HomeRepository homeRepository;
  LogoutUsecase({required this.homeRepository});
  @override
  Future<Either<Failure, String>> call(LogoutParams params) async {
    return await homeRepository.logout();
  }
}

class LogoutParams {}
