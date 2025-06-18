import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';

class BankTile extends StatelessWidget {
  final VoidCallback onDeletePressed;
  final String bankName;
  final String bankBranch;
  final String bankAccountNumber;
  final String bankIfscCode;
  final String bankHolderName;

  const BankTile({
    super.key,
    required this.bankName,
    required this.bankAccountNumber,
    required this.onDeletePressed,
    required this.bankBranch,
    required this.bankHolderName,
    required this.bankIfscCode,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      isThreeLine: true,
      minVerticalPadding: 6,
      leading: Container(
        decoration: BoxDecoration(
          color: AppColors.opacBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 50,
        height: 50,
        child: Center(
          child: Icon(
            Icons.account_balance_rounded,
            color: AppColors.blue,
          ),
        ),
      ),
      title: Text(
        bankName,
        style: Theme.of(context).textTheme.titleSmall,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Branch: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  bankBranch,
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Account Number: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  bankAccountNumber,
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "IFSC: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  bankIfscCode,
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account Holder: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  bankHolderName,
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
      trailing: IconButton(
        onPressed: onDeletePressed,
        icon: Icon(
          Icons.delete,
          color: AppColors.red,
        ),
      ),
    );
  }
}
