import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/billing/domain/repository/billing_repository.dart';

class SubmitInvoiceUsecases implements Usecase<String, SubmitInvoiceParams> {
  final BillingRepository billingRepository;
  SubmitInvoiceUsecases({
    required this.billingRepository,
  });
  @override
  Future<Either<Failure, String>> call(SubmitInvoiceParams params) async {
    return await billingRepository.submitInvoice(
      billNo: params.invoiceNumber,
      billName: params.invoiceName,
      stateCode: params.stateCode,
      vehicleNumber: params.vehicleNumber,
      challanNumber: params.challanNumber,
      dateOfSupply: params.dateOfSupply,
      placeOfSupply: params.placeOfSupply,
      state: params.state,
      reverseCharge: params.reverseCharge,
      firmId: params.firmId,
      logisticId: params.logisticId,
      customerId: params.customerId,
      bankId: params.bankId,
    );
  }
}

class SubmitInvoiceParams {
  final String invoiceNumber;
  final String invoiceName;
  final String dateOfSupply;
  final String placeOfSupply;
  final String vehicleNumber;
  final String challanNumber;
  final String firmId;
  final String logisticId;
  final String bankId;
  final String customerId;
  final String state;
  final String stateCode;
  final String reverseCharge;
  SubmitInvoiceParams({
    required this.bankId,
    required this.challanNumber,
    required this.customerId,
    required this.dateOfSupply,
    required this.firmId,
    required this.invoiceName,
    required this.invoiceNumber,
    required this.logisticId,
    required this.placeOfSupply,
    required this.reverseCharge,
    required this.state,
    required this.stateCode,
    required this.vehicleNumber,
  });
}
