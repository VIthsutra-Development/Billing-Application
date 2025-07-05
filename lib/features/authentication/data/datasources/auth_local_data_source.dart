import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:new_billing/core/failures/exceptions.dart';

abstract interface class AuthLocalDataSource {
  String saveCredentials({
    required String token,
  });
  String? autoLogin();
  String saveEmailOtpCredentials({
    required String email,
  });
  String saveTokenOtpCredentials({
    required String token,
  });
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box<String> box;
  AuthLocalDataSourceImpl({required this.box});
  @override
  String saveCredentials({required String token}) {
    try {
      box.put("token", token);
      final userDetails = JwtDecoder.decode(token);
      box.put("user_id", userDetails["user_id"]);
      return "Credentials Saved Successfully";
    } catch (e) {
      throw LocalStorageException(
        message: "Exception while Storing the Data Locally.",
      );
    }
  }

  @override
  String? autoLogin() {
    final token = box.get("token");
    return token;
  }

  @override
  String saveEmailOtpCredentials({required String email}) {
    try {
      box.put("email", email);
      return "Credentials Saved Successfully";
    } catch (e) {
      throw LocalStorageException(
        message: "Exception while Storing the Data Locally.",
      );
    }
  }

  @override
  String saveTokenOtpCredentials({required String token}) {
    try {
      box.put("token", token);
      final userDetails = JwtDecoder.decode(token);
      box.put("user_id", userDetails["user_id"]);
      return "Credentials Saved Successfully";
    } catch (e) {
      throw LocalStorageException(
        message: "Exception while Storing the Data Locally.",
      );
    }
  }
}
