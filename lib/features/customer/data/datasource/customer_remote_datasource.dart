import 'dart:convert';

import 'package:new_billing/core/constants/urls.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/utils/connection/connection.dart';
import 'package:new_billing/features/customer/data/models/customer_model.dart';
import 'package:http/http.dart' as http;

abstract interface class CustomerRemoteDataSource {
  Future<List<CustomerModel>> fetchCustomer({
    required String userId,
  });
  Future<String> addCustomer({required CustomerModel customerModel});
  Future<String> deleteCustomer({
    required String customerId,
  });
}

class CustomerRemoteDataSourceImpl implements CustomerRemoteDataSource {
  final Connection connection;
  final http.Client client;
  CustomerRemoteDataSourceImpl({
    required this.connection,
    required this.client,
  });
  @override
  Future<String> addCustomer({
    required CustomerModel customerModel,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected to Internet.");
      }
      final jsonResponse = await client.post(
        Uri.parse(AppUrls.createReceiver),
        body: jsonEncode(customerModel.toJson()),
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
  Future<List<CustomerModel>> fetchCustomer({
    required String userId,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.get(
        Uri.parse("${AppUrls.getReceiver}/$userId"),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      if (response["receiver_details"] == null) {
        return <CustomerModel>[];
      }
      final List<CustomerModel> customer =
          (response["receiver_details"] as List)
              .map((ele) => CustomerModel.fromJson(ele))
              .toList();
      return customer;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<String> deleteCustomer({
    required String customerId,
  }) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.delete(
        Uri.parse("${AppUrls.deleteReceiver}/$customerId"),
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
