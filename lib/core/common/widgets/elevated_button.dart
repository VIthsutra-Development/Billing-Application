import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_billing/core/themes/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isLoading;
  const CustomElevatedButton({super.key , required this.buttonText , required this.onPressed , this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: isLoading ? null : onPressed,
      child:isLoading? SizedBox(width: 30 , height: 30,child: CircularProgressIndicator(color: AppColors.white,strokeCap: StrokeCap.round,)): Text(
        buttonText,
        style: GoogleFonts.poppins(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
