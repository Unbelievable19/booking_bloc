import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData mainTheme = ThemeData(
      fontFamily: 'TimesNewRoman',
      primaryColor: Colors.white,
      scaffoldBackgroundColor: const Color(0xFFF6F6F9),
      dividerTheme: const DividerThemeData(color: Color(0xFFE9EAEC)),
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: appColors.addressColor));

  static const appColors = CustomColors(
    addressColor: Color(0xFF0D72FF),
    bestRatingTextColor: Color(0xFFFFA800),
    bestRatingBackgroundColor: Color(0x33FFC700),
    anyRatingBackgroundColor: Color(0xFFE7F1FF),
    anyRatingTextColor: Color(0xFF0D72FF),
    textColor: Colors.black,
    secondaryTextColor: Color(0xFF828796),
    blockBackgroundColor: Colors.white,
    itemBackgroundColor: Color(0xE8F1F1F1),
    textFieldHintColor: Color(0xFFA9ABB7),
    textFieldValueColor: Color(0xFF14142B),
    formErrorColor: Color(0x26EB5757),
  );
}

class CustomColors {
  final Color bestRatingBackgroundColor;
  final Color bestRatingTextColor;

  final Color anyRatingBackgroundColor;
  final Color anyRatingTextColor;

  final Color addressColor;

  final Color textColor;
  final Color secondaryTextColor;

  final Color blockBackgroundColor;
  final Color itemBackgroundColor;

  final Color textFieldHintColor;
  final Color textFieldValueColor;

  final Color formErrorColor;
  const CustomColors({
    required this.bestRatingBackgroundColor,
    required this.bestRatingTextColor,
    required this.anyRatingBackgroundColor,
    required this.anyRatingTextColor,
    required this.addressColor,
    required this.textColor,
    required this.secondaryTextColor,
    required this.blockBackgroundColor,
    required this.itemBackgroundColor,
    required this.textFieldHintColor,
    required this.textFieldValueColor,
    required this.formErrorColor,
  });
}
