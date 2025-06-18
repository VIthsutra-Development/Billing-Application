import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_billing/core/themes/colors.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String hintText;
  final IconData prefixIcon;
  final bool isPasswordField;
  final int? maxLength;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.keyboardType,
    this.isPasswordField = false,
    this.validator,
    this.maxLength,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool isPasswordField;
  bool obscureText = false;
  @override
  void initState() {
    isPasswordField = widget.isPasswordField;
    if (isPasswordField) {
      obscureText = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(color: AppColors.black),
      obscureText: obscureText,
      maxLength: widget.maxLength,
      cursorColor: AppColors.blue,
      controller: widget.controller,
      cursorHeight: 24,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        counterText: "",
        hintText: widget.hintText,
        suffixIcon: isPasswordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: obscureText
                    ? Icon(Icons.remove_red_eye_rounded)
                    : Icon(Icons.remove_red_eye_outlined),
              )
            : null,
        prefixIcon: Icon(widget.prefixIcon),
      ),
    );
  }
}
