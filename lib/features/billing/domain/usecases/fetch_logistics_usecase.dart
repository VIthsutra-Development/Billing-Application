import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/features/billing/domain/repository/billing_repository.dart';

class FetchLogisticsUsecases
    implements Usecase<List<DropDownElements>, FetchLogisticsParams> {
  final BillingRepository billingRepository;
  FetchLogisticsUsecases({
    required this.billingRepository,
  });
  @override
  Future<Either<Failure, List<DropDownElements>>> call(
      FetchLogisticsParams params) async {
    return await billingRepository.fetchLogistic();
  }
}

class FetchLogisticsParams {}
