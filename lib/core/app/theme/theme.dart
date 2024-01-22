// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    background: AppColors.splashBlack,
    primary: Colors.white,
  ),
);
