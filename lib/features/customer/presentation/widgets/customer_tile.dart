import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';

class CustomerTile extends StatelessWidget {
  final VoidCallback onDeletePressed;
  final String customerName;
  final String customerGstNumber;
  final String customerState;
  final String customerAddress;

  const CustomerTile({
    super.key,
    required this.customerName,
    required this.onDeletePressed,
    required this.customerAddress,
    required this.customerGstNumber,
    required this.customerState,
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
            Icons.person,
            color: AppColors.blue,
          ),
        ),
      ),
      title: Text(
        customerName,
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
                "GSTIN: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  customerGstNumber,
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
                "State: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  customerState,
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
                "Address: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  customerAddress,
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
