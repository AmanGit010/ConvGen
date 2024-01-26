// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'feature/app/app.dart';
import 'feature/app/theme/theme_provider.dart';

void main() async {
  await Hive.initFlutter();

  //Opening the hive box
  await Hive.openBox('keyBox');

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const App(),
    ),
  );
}
