import 'package:new_billing/features/authentication/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.email, required super.password});
  Map<String, dynamic> toJson() {
    return {
      "user_email": email,
      "user_password": password,
    };
  }
}
