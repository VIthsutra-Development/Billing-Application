import 'package:new_billing/features/customer/domain/entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({
    required super.customerId,
    required super.customerName,
    required super.customerAddress,
    required super.customerGstNumber,
    required super.customerState,
    required super.customerStateCode,
    required super.userId,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      customerId: json["receiver_id"],
      customerName: json["receiver_name"],
      customerAddress: json["receiver_address"],
      customerGstNumber: json["receiver_gstin"],
      customerState: json["receiver_state"],
      customerStateCode: json["receiver_state_code"],
      userId: json["user_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "receiver_name": customerName,
      "receiver_address": customerAddress,
      "receiver_gstin": customerGstNumber,
      "receiver_state": customerState,
      "receiver_state_code": customerStateCode,
      "user_id": userId,
    };
  }
}
