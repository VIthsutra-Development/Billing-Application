import "dart:convert";

import "package:http/http.dart" as http;
import "package:new_billing/core/constants/urls.dart";
import "package:new_billing/core/failures/exceptions.dart";
import "package:new_billing/core/utils/connection/connection.dart";
import "package:new_billing/features/authentication/data/models/forgot_pass_model.dart";
import "package:new_billing/features/authentication/data/models/login_model.dart";
import "package:new_billing/features/authentication/data/models/otp_model.dart";
import "package:new_billing/features/authentication/data/models/register_model.dart";

abstract interface class AuthRemoteDataSource {
  Future<String> login({required LoginModel loginDetails});
  Future<String> register({required RegisterModel registerDetails});
  Future<String> forgotPass({required ForgotPassModel forgotDetails});
  Future<String> validateOtp({required ValidateOtpModel otpDetails});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  final Connection connection;
  AuthRemoteDataSourceImpl({required this.client, required this.connection});
  @override
  Future<String> login({required LoginModel loginDetails}) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.post(
        Uri.parse(AppUrls.login),
        body: jsonEncode(loginDetails.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["error"]);
      }
      return response["data"]["token_id"];
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<String> register({required RegisterModel registerDetails}) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.post(
        Uri.parse(AppUrls.register),
        body: jsonEncode(registerDetails.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 201) {
        throw ServerException(message: response["error"]);
      }
      return response["data"];
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<String> forgotPass({required ForgotPassModel forgotDetails}) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.post(
        Uri.parse(AppUrls.forgotPass),
        body: jsonEncode(forgotDetails.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["error"]);
      }
      return response["message"];
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<String> validateOtp({required ValidateOtpModel otpDetails}) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.post(
        Uri.parse(AppUrls.otp),
        body: jsonEncode(otpDetails.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["error"]);
      }
      return response["message"];
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }
}
