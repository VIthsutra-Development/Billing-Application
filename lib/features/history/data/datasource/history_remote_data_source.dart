import 'dart:convert';

import 'package:new_billing/core/constants/urls.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/utils/connection/connection.dart';
import 'package:new_billing/features/history/data/models/history_model.dart';
import 'package:http/http.dart' as http;

abstract interface class HistoryRemoteDataSource {
  Future<List<HistoryModel>> getInvoices({
    required String userId,
  });
  Future<String> markAsPaid({
    required String invoiceId,
  });
  Future<String> deleteInvoice({
    required String invoiceId,
  });
}

class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource {
  final http.Client client;
  final Connection connection;
  HistoryRemoteDataSourceImpl({
    required this.client,
    required this.connection,
  });
  @override
  Future<List<HistoryModel>> getInvoices({required String userId}) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.get(
        Uri.parse("${AppUrls.fetchInvoices}/$userId"),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      if (response["invoices"] == null) {
        return <HistoryModel>[];
      }
      final List<HistoryModel> history = (response["invoices"] as List)
          .map((ele) => HistoryModel.fromJson(ele))
          .toList();
      return history;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: "Exception while Communicating with The Server.",
      );
    }
  }

  @override
  Future<String> markAsPaid({required String invoiceId}) async {
    try {
      final jsonResponse = await client.patch(
        Uri.parse("${AppUrls.makePayment}/$invoiceId"),
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
        message: "Exception while Communicating with The Server.",
      );
    }
  }

  @override
  Future<String> deleteInvoice({required String invoiceId}) async {
    try {
      final jsonResponse = await http.delete(
        Uri.parse("${AppUrls.deleteInvoice}/$invoiceId"),
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
          message: "Exception while Communicating with The Server.");
    }
  }
}
