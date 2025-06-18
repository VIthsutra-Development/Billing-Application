import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';

class AppSnackBar {
  final String message;
  AppSnackBar({required this.message});

  SnackBar build(BuildContext context) {
    return SnackBar(
      content: Text(
        message,
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(color: AppColors.white),
      ),
      backgroundColor: AppColors.blue,
      elevation: 1,
      behavior: SnackBarBehavior.fixed,
    );
  }
}
