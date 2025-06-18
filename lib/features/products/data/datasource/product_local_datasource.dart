import 'package:hive/hive.dart';
import 'package:new_billing/core/failures/exceptions.dart';

abstract interface class ProductLocalDatasource {
  String getInvoiceId();
}

class ProductLocalDatasourceImpl implements ProductLocalDatasource {
  final Box<String> box;
  ProductLocalDatasourceImpl({required this.box});
  @override
  String getInvoiceId() {
    final String? invoiceId = box.get("invoice_id");
    if (invoiceId == null) {
      throw LocalStorageException(message: "Invalid Invoice ID.");
    }
    return invoiceId;
  }
}
