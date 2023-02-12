import 'package:flutter/material.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: accentColor,
  ),
  fontFamily: 'Roboto',
);
