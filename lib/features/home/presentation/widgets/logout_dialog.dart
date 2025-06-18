import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';

class AppLogoutConfirmationBottomSheet extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onLogoutPressed;
  const AppLogoutConfirmationBottomSheet({
    super.key,
    this.isLoading = false,
    required this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment(-1, 0),
            child: Text(
              "Logout",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment(-1, 0),
            child: Text(
              "Do You Really Want to Logout?",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AppFilledButton(
            isLoading: isLoading,
            onPressed: onLogoutPressed,
            buttonText: "Logout",
            color: AppColors.red,
          ),
        ],
      ),
    );
  }
}
