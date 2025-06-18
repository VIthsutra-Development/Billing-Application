import 'package:new_billing/features/logistic/domain/entities/logistic_entity.dart';

class LogisticModel extends LogisticEntity {
  LogisticModel({
    required super.logisticId,
    required super.logisticName,
    required super.logisticAddress,
    required super.logisticGstNumber,
    required super.logisticPhoneNumber,
    required super.logisticState,
    required super.logisticStateCode,
    required super.userId,
  });

  factory LogisticModel.fromJson(Map<String, dynamic> json) {
    return LogisticModel(
      logisticId: json["consignee_id"],
      logisticName: json["consignee_name"],
      logisticAddress: json["consignee_address"],
      logisticGstNumber: json["consignee_gstin"],
      logisticPhoneNumber: json["consignee_phone_number"],
      logisticState: json["consignee_state"],
      logisticStateCode: json["consignee_state_code"],
      userId: json["user_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "consignee_name": logisticName,
      "consignee_address": logisticAddress,
      "consignee_gstin": logisticGstNumber,
      "consignee_phone_number": logisticPhoneNumber,
      "consignee_state": logisticState,
      "consignee_state_code": logisticStateCode,
      "user_id": userId,
    };
  }
}
