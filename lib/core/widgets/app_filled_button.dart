import 'package:flutter/material.dart';
import 'package:new_billing/core/themes/colors.dart';

class AppFilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool isLoading;
  final Color color;
  const AppFilledButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
    this.color = AppColors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: color,
      ),
      child:
          isLoading
              ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: color,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 2.5,
                ),
              )
              : Text(
                buttonText,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.white),
              ),
    );
  }
}