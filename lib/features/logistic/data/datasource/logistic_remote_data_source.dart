import 'dart:convert';

import 'package:new_billing/core/constants/urls.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/utils/connection/connection.dart';
import 'package:new_billing/features/logistic/data/models/logistic_model.dart';
import 'package:http/http.dart' as http;

abstract interface class LogisticRemoteDataSource {
  Future<List<LogisticModel>> fetchLogistics({
    required String userId,
  });
  Future<String> addLogistic({required LogisticModel logisticModel});
  Future<String> deleteLogistic({
    required String logisticId,
  });
}

class LogisticRemoteDataSourceImpl implements LogisticRemoteDataSource {
  final Connection connection;
  final http.Client client;
  LogisticRemoteDataSourceImpl({
    required this.connection,
    required this.client,
  });
  @override
  Future<String> addLogistic({
    required LogisticModel logisticModel,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected to Internet.");
      }
      final jsonResponse = await client.post(
        Uri.parse(AppUrls.createShipper),
        body: jsonEncode(logisticModel.toJson()),
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
  Future<List<LogisticModel>> fetchLogistics({
    required String userId,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.get(
        Uri.parse("${AppUrls.getShipper}/$userId"),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      if (response["consignee_details"] == null) {
        return <LogisticModel>[];
      }
      final List<LogisticModel> logistics =
          (response["consignee_details"] as List)
              .map((ele) => LogisticModel.fromJson(ele))
              .toList();
      return logistics;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<String> deleteLogistic({
    required String logisticId,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.delete(
        Uri.parse("${AppUrls.deleteShipper}/$logisticId"),
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
