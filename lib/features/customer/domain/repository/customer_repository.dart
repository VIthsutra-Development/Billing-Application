import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/customer/domain/entities/customer_entity.dart';

abstract interface class CustomerRepository {
  Future<Either<Failure, List<CustomerEntity>>> fetchCustomer();
  Future<Either<Failure, String>> addCustomer({
    required String customerName,
    required String customerAddress,
    required String customerGstNumber,
    required String customerState,
    required String customerStateCode,
  });
  Future<Either<Failure, String>> deleteCustomer({
    required String customerId,
  });
}
