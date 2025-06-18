import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/features/billing/domain/repository/billing_repository.dart';

class FetchCustomerUsecases
    implements Usecase<List<DropDownElements>, FetchCustomerParams> {
  final BillingRepository billingRepository;
  FetchCustomerUsecases({
    required this.billingRepository,
  });
  @override
  Future<Either<Failure, List<DropDownElements>>> call(
      FetchCustomerParams params) async {
    return await billingRepository.fetchCustomer();
  }
}

class FetchCustomerParams {}
