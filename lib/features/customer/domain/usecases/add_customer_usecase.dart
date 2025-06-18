import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/customer/domain/repository/customer_repository.dart';

class AddCustomerUsecase implements Usecase<String, AddCustomerParams> {
  final CustomerRepository customerRepository;
  AddCustomerUsecase({required this.customerRepository});
  @override
  Future<Either<Failure, String>> call(AddCustomerParams params) async {
    return await customerRepository.addCustomer(
      customerName: params.customerName,
      customerAddress: params.customerAddress,
      customerGstNumber: params.customerGstNumber,
      customerState: params.customerState,
      customerStateCode: params.customerStateCode,
    );
  }
}

class AddCustomerParams {
  final String customerName;
  final String customerAddress;
  final String customerGstNumber;
  final String customerState;
  final String customerStateCode;
  AddCustomerParams({
    required this.customerAddress,
    required this.customerGstNumber,
    required this.customerName,
    required this.customerState,
    required this.customerStateCode,
  });
}
