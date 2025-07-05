import 'package:new_billing/features/authentication/domain/entities/otp_entity.dart';

class ValidateOtpModel extends ValidateOtpEntity {
  ValidateOtpModel({required super.otp});
  Map<String, dynamic> toJson() {
    return {"otp": otp};
  }
}
