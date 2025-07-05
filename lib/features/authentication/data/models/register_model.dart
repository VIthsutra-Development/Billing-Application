import 'package:new_billing/features/authentication/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({
    required super.userName,
    required super.email,
    required super.password,
    required super.userPhone,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_name": userName,
      "user_email": email,
      "user_password": password,
      "user_phone": userPhone,
    };
  }
}
