import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';

class FirmTile extends StatelessWidget {
  final VoidCallback onDeletePressed;
  final String firmName;
  final String firmPhoneNumber;
  final String firmGstNumber;
  final String firmAddress;
  final String firmEmail;
  final String firmPanNumber;

  const FirmTile({
    super.key,
    required this.firmName,
    required this.firmPhoneNumber,
    required this.onDeletePressed,
    required this.firmAddress,
    required this.firmGstNumber,
    required this.firmEmail,
    required this.firmPanNumber,
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
        firmName,
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
                  firmPhoneNumber,
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
                  firmGstNumber,
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
                "Email: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  firmEmail,
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
                "PAN: ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Expanded(
                child: Text(
                  firmPanNumber,
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
                  firmAddress,
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
