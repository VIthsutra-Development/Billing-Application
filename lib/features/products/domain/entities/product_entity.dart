class ProductEntity {
  final String productId;
  final String productName;
  final String productHsn;
  final String productQuantity;
  final String productUnit;
  final String productRate;
  final String invoiceId;
  final String total;

  ProductEntity({
    required this.invoiceId,
    required this.productHsn,
    required this.productId,
    required this.productName,
    required this.productQuantity,
    required this.productRate,
    required this.productUnit,
    required this.total,
  });
}
