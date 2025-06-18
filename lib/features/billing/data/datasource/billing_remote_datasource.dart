import 'dart:convert';

import 'package:new_billing/core/constants/urls.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/utils/connection/connection.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/features/billing/data/models/billing_model.dart';
import 'package:http/http.dart' as http;

abstract interface class BillingRemoteDatasource {
  Future<List<DropDownElements>> getFirms({
    required String userId,
  });
  Future<List<DropDownElements>> getLogistics({
    required String userId,
  });
  Future<List<DropDownElements>> getCustomers({
    required String userId,
  });
  Future<List<DropDownElements>> getBanks({
    required String userId,
  });
  Future<String> submitBillingForm({
    required BillingModel billingDetails,
  });
}

class BillingRemoteDatasourceImpl implements BillingRemoteDatasource {
  final Connection connection;
  final http.Client client;
  BillingRemoteDatasourceImpl({
    required this.client,
    required this.connection,
  });
  @override
  Future<List<DropDownElements>> getCustomers({required String userId}) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.get(
        Uri.parse("${AppUrls.getReceivers}/$userId"),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      if (response["receiver_details"] == null) {
        return <DropDownElements>[];
      }
      final List<DropDownElements> elements =
          (response["receiver_details"] as List)
              .map(
                (ele) => DropDownElements(
                  id: ele["receiver_id"],
                  name: ele["receiver_name"],
                ),
              )
              .toList();
      return elements;
    } on ServerException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<List<DropDownElements>> getFirms({required String userId}) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.get(
        Uri.parse("${AppUrls.getBiller}/$userId"),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      if (response == null) {
        return <DropDownElements>[];
      }
      final List<DropDownElements> firms = (response as List)
          .map(
            (ele) => DropDownElements(
              id: ele["biller_id"],
              name: ele["biller_name"],
            ),
          )
          .toList();
      return firms;
    } on ServerException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<List<DropDownElements>> getLogistics({required String userId}) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.get(
        Uri.parse("${AppUrls.getConsignees}/$userId"),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      if (response["consignee_details"] == null) {
        return <DropDownElements>[];
      }
      final List<DropDownElements> logistics =
          (response["consignee_details"] as List)
              .map(
                (ele) => DropDownElements(
                  id: ele["consignee_id"],
                  name: ele["consignee_name"],
                ),
              )
              .toList();
      return logistics;
    } on ServerException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } catch (_) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<String> submitBillingForm({
    required BillingModel billingDetails,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(
          message: "Not Connected To Internet.",
        );
      }
      final jsonResponse = await http.post(
        Uri.parse(AppUrls.createInvoice),
        body: jsonEncode(billingDetails.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      return response["invoice_id"];
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<List<DropDownElements>> getBanks({required String userId}) async {
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
        return <DropDownElements>[];
      }
      final List<DropDownElements> banks = (response["bankers"] as List)
          .map(
            (ele) => DropDownElements(
              id: ele["bank_id"],
              name: ele["bank_name"],
            ),
          )
          .toList();
      return banks;
    } on ServerException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }
}
