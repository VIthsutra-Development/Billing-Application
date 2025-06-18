import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';

abstract interface class BillingRepository {
  Future<Either<Failure, List<DropDownElements>>> fetchFirm();
  Future<Either<Failure, List<DropDownElements>>> fetchLogistic();
  Future<Either<Failure, List<DropDownElements>>> fetchCustomer();
  Future<Either<Failure, List<DropDownElements>>> fetchBanks();
  Future<Either<Failure, String>> submitInvoice({
    required String billNo,
    required String billName,
    required String stateCode,
    required String vehicleNumber,
    required String challanNumber,
    required String dateOfSupply,
    required String placeOfSupply,
    required String state,
    required String reverseCharge,
    required String firmId,
    required String logisticId,
    required String customerId,
    required String bankId,
  });
}
