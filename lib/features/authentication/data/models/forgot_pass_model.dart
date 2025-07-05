import 'package:new_billing/features/authentication/domain/entities/forgot_entity.dart';

class ForgotPassModel extends ForgotEntity {
  ForgotPassModel({required super.email});
  Map<String, dynamic> toJson() {
    return {"user_email": email};
  }
}
