import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/customer/data/datasource/customer_local_datasource.dart';
import 'package:new_billing/features/customer/data/datasource/customer_remote_datasource.dart';
import 'package:new_billing/features/customer/data/models/customer_model.dart';
import 'package:new_billing/features/customer/domain/repository/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerLocalDatasource customerLocalDataSource;
  final CustomerRemoteDataSource customerRemoteDataSource;
  CustomerRepositoryImpl({
    required this.customerLocalDataSource,
    required this.customerRemoteDataSource,
  });
  @override
  Future<Either<Failure, String>> addCustomer({
    required String customerName,
    required String customerAddress,
    required String customerGstNumber,
    required String customerState,
    required String customerStateCode,
  }) async {
    try {
      final userId = customerLocalDataSource.getUserId();
      final response = await customerRemoteDataSource.addCustomer(
        customerModel: CustomerModel(
          customerId: "",
          customerName: customerName,
          customerAddress: customerAddress,
          customerGstNumber: customerGstNumber,
          customerState: customerState,
          customerStateCode: customerStateCode,
          userId: userId,
        ),
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } on LocalStorageException catch (e) {
      return Left(Failure(message: e.message));
    } catch (_) {
      return Left(Failure(message: "Exception While Processing The Request."));
    }
  }

  @override
  Future<Either<Failure, String>> deleteCustomer({
    required String customerId,
  }) async {
    try {
      final response = await customerRemoteDataSource.deleteCustomer(
        customerId: customerId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } catch (_) {
      return Left(Failure(message: "Exception While Processing The Request"));
    }
  }

  @override
  Future<Either<Failure, List<CustomerModel>>> fetchCustomer() async {
    try {
      final userId = customerLocalDataSource.getUserId();
      final customers =
          await customerRemoteDataSource.fetchCustomer(userId: userId);
      return Right(customers);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    } on LocalStorageException catch (e) {
      return Left(Failure(message: e.message));
    } catch (_) {
      return Left(Failure(message: "Exception While Processing The Request."));
    }
  }
}
