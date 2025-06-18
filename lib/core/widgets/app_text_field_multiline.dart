import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_billing/core/themes/colors.dart';

class AppTextFieldMultiline extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String hintText;
  final int maxLines;
  final int? maxLength;
  const AppTextFieldMultiline({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.maxLines,
    this.validator,
    this.maxLength,
  });

  @override
  State<AppTextFieldMultiline> createState() => _AppTextFieldMultilineState();
}

class _AppTextFieldMultilineState extends State<AppTextFieldMultiline> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      style: GoogleFonts.poppins(color: AppColors.black),
      cursorColor: AppColors.blue,
      controller: widget.controller,
      cursorHeight: 24,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
    );
  }
}
