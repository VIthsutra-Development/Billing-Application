import 'package:new_billing/features/history/domain/entities/history_entity.dart';

class HistoryModel extends HistoryEntity {
  HistoryModel({
    required super.invoiceId,
    required super.invoiceName,
    required super.paymentStatus,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      invoiceId: json["invoice_id"],
      invoiceName: json["name"],
      paymentStatus: json["payment_status"],
    );
  }
}
