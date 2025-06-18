import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';

class LogisticTile extends StatelessWidget {
  final VoidCallback onDeletePressed;
  final String logisticName;
  final String logisticPhoneNumber;
  final String logisticGstNumber;
  final String logisticState;
  final String logisticAddress;

  const LogisticTile({
    super.key,
    required this.logisticName,
    required this.logisticPhoneNumber,
    required this.onDeletePressed,
    required this.logisticAddress,
    required this.logisticGstNumber,
    required this.logisticState,
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
        logisticName,
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
                "Phone: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  logisticPhoneNumber,
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
                "GSTIN: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  logisticGstNumber,
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
                  logisticState,
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
                  logisticAddress,
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
