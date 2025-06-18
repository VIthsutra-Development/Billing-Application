import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/home/data/datasource/home_local_datasource.dart';
import 'package:new_billing/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDatasource homeLocalDatasource;
  HomeRepositoryImpl({required this.homeLocalDatasource});
  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final response = homeLocalDatasource.logout();
      return Right(response);
    } on LocalStorageException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(
        Failure(
          message: "Exception While Logout.",
        ),
      );
    }
  }
}
