import 'package:new_billing/features/firm/domain/entities/firm_entity.dart';

class FirmModel extends FirmEntity {
  FirmModel({
    required super.firmId,
    required super.firmName,
    required super.firmAddress,
    required super.firmGstNumber,
    required super.userId,
    required super.firmEmail,
    required super.firmPan,
    required super.firmPhoneNumber,
    required super.firmLogo,
  });

  factory FirmModel.fromJson(Map<String, dynamic> json) {
    return FirmModel(
      firmId: json["biller_id"],
      firmName: json["biller_name"],
      firmAddress: json["biller_address"],
      firmGstNumber: json["biller_gstin"],
      firmEmail: json["biller_mail"],
      firmPan: json["biller_pan"],
      firmPhoneNumber: json["biller_mobile"],
      userId: json["user_id"],
      firmLogo: null,
    );
  }
}
