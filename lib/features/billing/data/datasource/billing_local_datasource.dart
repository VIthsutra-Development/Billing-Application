import 'package:hive/hive.dart';
import 'package:new_billing/core/failures/exceptions.dart';

abstract interface class BillingLocalDatasource {
  String getUserId();
  String addInvoiceId({
    required String invoiceId,
  });
}

class BillingLocalDatasourceImpl implements BillingLocalDatasource {
  final Box<String> box;
  BillingLocalDatasourceImpl({
    required this.box,
  });
  @override
  String addInvoiceId({
    required String invoiceId,
  }) {
    box.put("invoice_id", invoiceId);
    return "Successfully Created Invoice";
  }

  @override
  String getUserId() {
    final userId = box.get("user_id");
    if (userId == null) {
      throw ServerException(
        message: "User Id Not Found.",
      );
    }
    return userId;
  }
}
