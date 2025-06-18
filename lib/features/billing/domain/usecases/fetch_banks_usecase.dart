import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/features/billing/domain/repository/billing_repository.dart';

class FetchBanksUsecases
    implements Usecase<List<DropDownElements>, FetchBanksParams> {
  final BillingRepository billingRepository;
  FetchBanksUsecases({
    required this.billingRepository,
  });
  @override
  Future<Either<Failure, List<DropDownElements>>> call(
      FetchBanksParams params) async {
    return await billingRepository.fetchBanks();
  }
}

class FetchBanksParams {}
