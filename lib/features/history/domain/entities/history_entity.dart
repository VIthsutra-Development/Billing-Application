class HistoryEntity {
  final String invoiceName;
  final String invoiceId;
  final bool paymentStatus;
  HistoryEntity({
    required this.invoiceId,
    required this.invoiceName,
    required this.paymentStatus,
  });
}
