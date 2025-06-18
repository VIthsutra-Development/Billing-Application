import 'package:new_billing/features/billing/domain/entities/billing_entity.dart';

class BillingModel extends BillingEntity {
  BillingModel({
    required super.billName,
    required super.billNumber,
    required super.challanNumber,
    required super.customer,
    required super.dateOfSupply,
    required super.firm,
    required super.logistic,
    required super.place,
    required super.reverseCharge,
    required super.state,
    required super.stateCode,
    required super.vehicleNumber,
    required super.userId,
    required super.bankId,
  });

  Map<String, dynamic> toJson() {
    return {
      "invoice_no": billNumber,
      "invoice_name": billName,
      "invoice_reverse_charge": reverseCharge,
      "invoice_state": state,
      "invoice_state_code": stateCode,
      "invoice_challan_number": challanNumber,
      "invoice_vehicle_number": vehicleNumber,
      "invoice_date_of_supply": dateOfSupply,
      "invoice_place_of_supply": place,
      "invoice_gst": "0",
      "user_id": userId,
      "receiver_id": customer,
      "biller_id": firm,
      "bank_id": bankId,
      "consignee_id": logistic,
    };
  }
}
