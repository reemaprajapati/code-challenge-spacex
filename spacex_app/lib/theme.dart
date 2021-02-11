import 'package:flutter/material.dart';
import 'package:spacex_app/res/colors.dart';

ThemeData appTheme() => ThemeData(
  // Define the default Brightness and Colors
  brightness: Brightness.light,

  primaryColor: AppColors.primaryColor,
  backgroundColor: AppColors.colorWhite,
  accentColor: AppColors.primaryColor,

  appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black, size: 5),
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),

  textTheme: AppTheme.textTheme,
);

class AppTheme {
  AppTheme._();

  static const TextTheme textTheme = TextTheme(
    bodyText1: font1,
    bodyText2: font2,
    headline1: boldFont,
  );

  static const TextStyle font1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.colorBlack,
  );

  static const TextStyle font2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.colorBlack,
  );

  static const TextStyle boldFont = TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: AppColors.colorBlack
  );

}