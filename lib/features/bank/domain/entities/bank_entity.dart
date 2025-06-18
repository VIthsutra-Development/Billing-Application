class BankEntity {
  final String bankId;
  final String bankName;
  final String bankAccountNumber;
  final String bankIfscCode;
  final String bankBranchName;
  final String bankAccountHolderName;
  final String userId;
  BankEntity({
    required this.bankId,
    required this.bankName,
    required this.bankAccountHolderName,
    required this.bankAccountNumber,
    required this.bankBranchName,
    required this.bankIfscCode,
    required this.userId,
  });
}
