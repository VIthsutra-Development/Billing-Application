import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/features/billing/domain/repository/billing_repository.dart';

class FetchFirmsUsecases
    implements Usecase<List<DropDownElements>, FetchFirmsParams> {
  final BillingRepository billingRepository;
  FetchFirmsUsecases({
    required this.billingRepository,
  });
  @override
  Future<Either<Failure, List<DropDownElements>>> call(
      FetchFirmsParams params) async {
    return await billingRepository.fetchFirm();
  }
}

class FetchFirmsParams {}
