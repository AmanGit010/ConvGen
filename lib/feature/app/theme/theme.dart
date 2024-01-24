// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
    secondary: AppColors.grey3,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    background: AppColors.splashBlack,
    primary: Colors.white,
    secondary: AppColors.grey3,
  ),
);
