import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/AppColors.dart';

abstract class AppStyles {
  static const double XBIG_FONT = 32.0;
  static const double BIG_FONT = 22.0;
  static const double MID_FONT = 18.0;
  static const double SMALL_FONT = 14.0;

  static TextStyle get temp => TextStyle(
        color: AppColors.textColor,
        fontSize: AppStyles.XBIG_FONT,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get title => temp.copyWith(fontSize: AppStyles.BIG_FONT);

  static TextStyle get subtitle => TextStyle(
        color: AppColors.textColor,
        fontSize: AppStyles.MID_FONT,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get body => TextStyle(
        color: AppColors.textColor,
        fontSize: AppStyles.SMALL_FONT,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get action => body.copyWith(color: AppColors.actionColor, fontWeight: FontWeight.w700);

  static TextTheme get appThemeText =>
      TextTheme(headline6: title, subtitle2: subtitle, bodyText2: body);

  static ThemeData get appTheme => ThemeData(
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.primaryDark,
      accentColor: AppColors.accent,
      fontFamily: "Roboto",
      textTheme: appThemeText);
}
