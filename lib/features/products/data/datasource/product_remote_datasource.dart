import 'dart:convert';

import 'package:new_billing/core/constants/urls.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/utils/connection/connection.dart';
import 'package:new_billing/features/products/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract interface class ProductRemoteDatasource {
  Future<List<ProductModel>> fetchProducts({
    required String invoiceId,
  });
  Future<String> deleteProducts({
    required String productId,
  });
  Future<String> addProduct({
    required ProductModel productDetails,
  });
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final Connection connection;
  final http.Client client;
  ProductRemoteDatasourceImpl({
    required this.client,
    required this.connection,
  });
  @override
  Future<String> addProduct({required ProductModel productDetails}) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.post(
        Uri.parse(AppUrls.addProducts),
        body: jsonEncode(productDetails.toJson()),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      return response["message"];
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (_) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<String> deleteProducts({required String productId}) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.delete(
        Uri.parse("${AppUrls.deleteProducts}/$productId"),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      return response["message"];
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (_) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }

  @override
  Future<List<ProductModel>> fetchProducts({required String invoiceId}) async {
    try {
      if (!await connection.checkConnection()) {
        throw ServerException(message: "Not Connected To Internet.");
      }
      final jsonResponse = await client.get(
        Uri.parse("${AppUrls.getProducts}/$invoiceId"),
        headers: {"Content-Type": "application/json"},
      );
      final response = jsonDecode(jsonResponse.body);
      print(response);
      if (jsonResponse.statusCode != 200) {
        throw ServerException(message: response["message"]);
      }
      if (response["receiver_details"] == null) {
        return <ProductModel>[];
      }
      final List<ProductModel> products = (response["receiver_details"] as List)
          .map((ele) => ProductModel.fromJson(ele))
          .toList();
      return products;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } catch (_) {
      throw ServerException(
        message: "Exception While Communicating With The Server.",
      );
    }
  }
}
