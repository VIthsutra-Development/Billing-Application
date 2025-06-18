import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';

abstract interface class Usecase <SuccessType,Params> {
  Future<Either<Failure , SuccessType>> call(Params params);
}