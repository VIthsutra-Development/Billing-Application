import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';

class AppDeleteConfirmationBottomSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isLoading;
  final VoidCallback onDeletePressed;
  const AppDeleteConfirmationBottomSheet({
    super.key,
    required this.title,
    required this.subtitle,
    this.isLoading = false,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 260,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment(-1, 0),
            child: Text(
              "Delete",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment(-1, 0),
            child: Text(
              "Do You Really Want to Delete?",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.opacRed,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    subtitle,
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Icon(
                    Icons.delete,
                    color: AppColors.red,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          AppFilledButton(
            isLoading: isLoading,
            onPressed: onDeletePressed,
            buttonText: "Delete",
            color: AppColors.red,
          ),
        ],
      ),
    );
  }
}
