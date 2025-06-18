import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';

abstract interface class HomeRepository {
  Future<Either<Failure,String>> logout();
}