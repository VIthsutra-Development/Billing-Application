import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/customer/domain/entities/customer_entity.dart';
import 'package:new_billing/features/customer/domain/repository/customer_repository.dart';

class FetchCustomerUsecase implements Usecase<List<CustomerEntity>, FetchCustomerParams> {
  final CustomerRepository customerRepository;
  FetchCustomerUsecase({required this.customerRepository});
  @override
  Future<Either<Failure, List<CustomerEntity>>> call(
    FetchCustomerParams params,
  ) async {
    return await customerRepository.fetchCustomer();
  }
}

class FetchCustomerParams {}
