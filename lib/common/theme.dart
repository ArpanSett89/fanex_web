import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'common.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        dividerColor: AppColors.lightGrey,
        brightness: Brightness.light,
        backgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.header,
            elevation: AppSizes.elevation1,
            centerTitle: true,
            titleTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: AppColors.white,
                fontSize: AppSizes.headline5,
                fontWeight: FontWeight.w600,
              ),
            ),
            foregroundColor: AppColors.white),
        scaffoldBackgroundColor: AppColors.scaffold,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        tabBarTheme: const TabBarTheme(
          labelColor: AppColors.orange,
          unselectedLabelColor: AppColors.grey,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: AppColors.orange)),
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: AppColors.black,
                fontSize: AppSizes.headline1,
                fontWeight: FontWeight.w700),
          ),
          headline2: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: AppColors.black,
                  fontSize: AppSizes.headline2,
                  fontWeight: FontWeight.w600)),
          headline3: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: AppColors.black,
                  fontSize: AppSizes.headline3,
                  fontWeight: FontWeight.w600)),
          headline4: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: AppColors.white,
                  fontSize: AppSizes.headline4,
                  fontWeight: FontWeight.w500)),
          headline5: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: AppColors.white,
                  fontSize: AppSizes.headline5,
                  fontWeight: FontWeight.w500)),
          headline6: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: AppSizes.headline6,
                  fontWeight: FontWeight.w500)),
          bodyText1: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: AppSizes.bodyText1,
                  fontWeight: FontWeight.w400)),
          bodyText2: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: AppSizes.bodyText2,
                  fontWeight: FontWeight.w400)),
          caption: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: AppSizes.caption,
                  fontWeight: FontWeight.w400)),
          button: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: AppColors.white,
                  fontSize: AppSizes.button,
                  fontWeight: FontWeight.w600)),
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }
}
