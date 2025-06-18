import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/customer/domain/repository/customer_repository.dart';

class DeleteCustomerUsecase implements Usecase<String, DeleteCustomerParams> {
  final CustomerRepository customerRepository;
  DeleteCustomerUsecase({required this.customerRepository});
  @override
  Future<Either<Failure, String>> call(DeleteCustomerParams params) async {
    return await customerRepository.deleteCustomer(
      customerId: params.customerId,
    );
  }
}

class DeleteCustomerParams {
  final String customerId;
  DeleteCustomerParams({required this.customerId});
}
