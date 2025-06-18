import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_billing/core/themes/colors.dart';

class AppTheme {
  static _borderStyle([Color? borderColor, double? borderWidth]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: borderColor ?? AppColors.moderateGrey,
          width: borderWidth ?? 1,
        ),
      );

  static final ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blue,
      iconTheme: const IconThemeData(size: 32, color: AppColors.white),
      actionsIconTheme: const IconThemeData(size: 30),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 5),
      elevation: 0,
      surfaceTintColor: AppColors.transparent,
      titleSpacing: 2,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: AppColors.blue,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarDividerColor: AppColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.white),
        foregroundColor: WidgetStateProperty.all(AppColors.blue),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: AppColors.blue, width: 2),
          ),
        ),
        surfaceTintColor: WidgetStateProperty.all(AppColors.white),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.poppins(
            color: AppColors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.blue,
      suffixIconColor: AppColors.blue,
      border: _borderStyle(),
      errorBorder: _borderStyle(AppColors.red, 2),
      focusedBorder: _borderStyle(AppColors.blue, 2),
      enabledBorder: _borderStyle(),
      disabledBorder: _borderStyle(),
      hintStyle: GoogleFonts.poppins(color: AppColors.darkGrey),
      errorStyle: GoogleFonts.poppins(color: AppColors.red),
    ),
    datePickerTheme: DatePickerThemeData(
      cancelButtonStyle: ButtonStyle(
        side: WidgetStatePropertyAll(BorderSide.none),
        foregroundColor: WidgetStateProperty.all(AppColors.blue),
        textStyle: WidgetStateProperty.all(GoogleFonts.poppins(fontSize: 16)),
      ),
      confirmButtonStyle: ButtonStyle(
        side: WidgetStatePropertyAll(BorderSide.none),
        foregroundColor: WidgetStateProperty.all(AppColors.blue),
        textStyle: WidgetStateProperty.all(GoogleFonts.poppins(fontSize: 16)),
      ),
      backgroundColor: AppColors.white,
      headerBackgroundColor: AppColors.blue,
      headerForegroundColor: AppColors.white,
      headerHelpStyle: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 14,
      ),
      headerHeadlineStyle: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 35,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      dividerHeight: 0,
      dividerColor: AppColors.white,
      indicatorColor: AppColors.blue,
      labelColor: AppColors.blue,
      overlayColor: WidgetStateProperty.all(AppColors.white),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
    ),
    cardTheme: CardThemeData(
      surfaceTintColor: AppColors.transparent,
      color: AppColors.white,
      elevation: 2,
      shadowColor: AppColors.lightBlue,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.blue,
      foregroundColor: AppColors.white,
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.poppins(
        color: AppColors.darkGrey,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: GoogleFonts.poppins(
        color: AppColors.darkGrey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.poppins(
        color: AppColors.darkGrey,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
