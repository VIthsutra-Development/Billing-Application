import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';

class HistoryTile extends StatelessWidget {
  final VoidCallback onTilePressed;
  final VoidCallback onDeletePressed;
  final String invoiceName;
  final String invoiceId;
  const HistoryTile({
    super.key,
    required this.onTilePressed,
    required this.onDeletePressed,
    required this.invoiceName,
    required this.invoiceId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        onTap: onTilePressed,
        leading: Container(
          decoration: BoxDecoration(
            color: AppColors.opacBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 50,
          height: 50,
          child: Center(
            child: Icon(
              Icons.history_rounded,
              color: AppColors.blue,
            ),
          ),
        ),
        title: Text(
          invoiceName,
          style: Theme.of(context).textTheme.titleSmall,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          invoiceId,
          style: Theme.of(context).textTheme.labelSmall,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          onPressed: onDeletePressed,
          icon: Icon(
            Icons.delete,
            color: AppColors.red,
          ),
        ),
      ),
    );
  }
}
