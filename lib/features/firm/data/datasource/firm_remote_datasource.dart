import 'dart:convert';

import 'package:new_billing/core/constants/urls.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/utils/connection/connection.dart';
import 'package:new_billing/features/firm/data/models/firm_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

abstract interface class FirmRemoteDataSource {
  Future<List<FirmModel>> fetchFirms({
    required String userId,
  });
  Future<String> addFirm({required FirmModel firmModel});
  Future<String> deleteFirm({
    required String firmId,
  });
}

class FirmRemoteDataSourceImpl implements FirmRemoteDataSource {
  final Connection connection;
  final http.Client client;
  FirmRemoteDataSourceImpl({
    required this.connection,
    required this.client,
  });
  @override
  Future<String> addFirm({
    required FirmModel firmModel,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected to Internet.");
      }
      final request = http.MultipartRequest("POST", Uri.parse(AppUrls.createBiller));
      request.files.add(
        await http.MultipartFile.fromPath(
          "logo",
          firmModel.firmLogo!.path,
          contentType: MediaType("image", "jpg"),
        ),
      );
      request.fields["biller_name"] = firmModel.firmName;
      request.fields["biller_address"] = firmModel.firmAddress;
      request.fields["biller_mobile"] = firmModel.firmPhoneNumber;
      request.fields["biller_gstin"] = firmModel.firmGstNumber;
      request.fields["biller_pan"] = firmModel.firmPan;
      request.fields["biller_mail"] = firmModel.firmEmail;
      request.fields["user_id"] = firmModel.userId;

      final streamedResponse = await request.send();
      final jsonResponse = await http.Response.fromStream(streamedResponse);
      final response = jsonDecode(jsonResponse.body);
      if (streamedResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      return response["message"];
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      print(e.toString());
      throw ServerException(
        message: "Exception While Communicating with The Server.",
      );
    }
  }

  @override
  Future<List<FirmModel>> fetchFirms({
    required String userId,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.get(
        Uri.parse("${AppUrls.getBiller}/$userId"),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      print(response);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      if (response == null) {
        return <FirmModel>[];
      }
      final List<FirmModel> firms = (response as List)
          .map((ele) => FirmModel.fromJson(ele))
          .toList();
      return firms;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      print(e.toString());
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<String> deleteFirm({
    required String firmId,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.delete(
        Uri.parse("${AppUrls.deleteBiller}/$firmId"),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      return response["message"];
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }
}
