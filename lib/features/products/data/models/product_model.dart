import 'package:new_billing/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.invoiceId,
    required super.productHsn,
    required super.productId,
    required super.productName,
    required super.productQuantity,
    required super.productRate,
    required super.productUnit,
    required super.total,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      invoiceId: json["invoice_id"],
      productHsn: json["product_hsn"],
      productId: json["product_id"],
      productName: json["product_name"],
      productQuantity: json["product_qty"],
      productRate: json["product_rate"],
      productUnit: json["product_unit"],
      total: json["total"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product_name": productName,
      "product_hsn": productHsn,
      "product_qty": productQuantity,
      "product_unit": productUnit,
      "product_rate": productRate,
      "invoice_id": invoiceId,
    };
  }
}
