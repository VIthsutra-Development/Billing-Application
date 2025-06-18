import 'dart:convert';

import 'package:new_billing/core/constants/urls.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/utils/connection/connection.dart';
import 'package:new_billing/features/bank/data/models/bank_model.dart';
import 'package:http/http.dart' as http;

abstract interface class BankRemoteDataSource {
  Future<List<BankModel>> fetchBanks({
    required String userId,
  });
  Future<String> addBank({required BankModel bankModel});
  Future<String> deleteBank({
    required String bankId,
  });
}

class BankRemoteDataSourceImpl implements BankRemoteDataSource {
  final Connection connection;
  final http.Client client;
  BankRemoteDataSourceImpl({
    required this.connection,
    required this.client,
  });
  @override
  Future<String> addBank({
    required BankModel bankModel,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected to Internet.");
      }
      final jsonResponse = await client.post(
        Uri.parse(AppUrls.addBank),
        body: jsonEncode(bankModel.toJson()),
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
        message: "Exception While Communicating with The Server.",
      );
    }
  }

  @override
  Future<List<BankModel>> fetchBanks({
    required String userId,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.get(
        Uri.parse("${AppUrls.getBank}/$userId"),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      if (response["bankers"] == null) {
        return <BankModel>[];
      }
      final List<BankModel> banks = (response["bankers"] as List)
          .map((ele) => BankModel.fromJson(ele))
          .toList();
      return banks;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<String> deleteBank({
    required String bankId,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.delete(
        Uri.parse("${AppUrls.deleteBank}/$bankId"),
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
