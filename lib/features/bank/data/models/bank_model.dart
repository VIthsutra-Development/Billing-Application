import 'package:new_billing/features/bank/domain/entities/bank_entity.dart';

class BankModel extends BankEntity {
  BankModel({
    required super.bankId,
    required super.bankName,
    required super.bankAccountHolderName,
    required super.bankAccountNumber,
    required super.bankBranchName,
    required super.bankIfscCode,
    required super.userId,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      bankId: json["bank_id"],
      bankName: json["bank_name"],
      bankAccountHolderName: json["bank_holder_name"],
      bankAccountNumber: json["bank_account_number"],
      bankBranchName: json["bank_branch"],
      bankIfscCode: json["bank_ifsc_code"],
      userId: json["user_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "bank_name": bankName,
      "bank_account_number": bankAccountNumber,
      "bank_holder_name": bankAccountHolderName,
      "bank_branch": bankBranchName,
      "bank_ifsc_code": bankIfscCode,
      "user_id": userId,
    };
  }
}
