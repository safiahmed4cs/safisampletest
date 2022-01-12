import 'package:flutter/material.dart';

class AppColors {
  static final Color defaultColor = _getColorFromHex(AppColors._defaultColor);
  static final Color white = _getColorFromHex(AppColors._white);
  static final Color black = _getColorFromHex(AppColors._black);
  static final Color grey = _getColorFromHex(AppColors._grey);

  static const String _defaultColor = "096894";
  static const String _white = "FFFFFF";
  static const String _black = "000000";
  static const String _grey = "DDDDDD";

  static Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }
}
