import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> register({
    required String userName,
    required String email,
    required String password, required userPhone,
  });
  Future<Either<Failure,String?>> autoLogin();
}
