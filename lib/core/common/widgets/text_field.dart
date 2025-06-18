import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_billing/core/themes/colors.dart';

class CustomTextField extends StatelessWidget {
  final int maxLength;
  final String labelText;
  final TextEditingController controller;
  final bool showWordCount;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool obscureText;
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    required this.maxLength,
    this.showWordCount = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLength: maxLength,
      readOnly: readOnly,
      onTap: onTap,
      cursorColor: AppColors.blue,
      cursorHeight: 18,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        counterText: showWordCount ? null : "",
        hintText: labelText,
      ),
    );
  }
}
