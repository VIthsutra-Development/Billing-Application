class BillingEntity {
  final String billName;
  final String billNumber;
  final String vehicleNumber;
  final String stateCode;
  final String challanNumber;
  final String dateOfSupply;
  final String place;
  final String state;
  final String reverseCharge;
  final String firm;
  final String logistic;
  final String customer;
  final String bankId;
  final String userId;

  BillingEntity({
    required this.billName,
    required this.billNumber,
    required this.challanNumber,
    required this.customer,
    required this.dateOfSupply,
    required this.firm,
    required this.logistic,
    required this.place,
    required this.reverseCharge,
    required this.state,
    required this.stateCode,
    required this.vehicleNumber,
    required this.userId,
    required this.bankId,
  });
}
