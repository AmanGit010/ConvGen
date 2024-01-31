import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import 'core/app_info.dart';
import 'feature/app/app.dart';
import 'feature/app/theme/theme_provider.dart';

void main() async {
  //Initialising hive db
  await Hive.initFlutter();

  //Opening the hive box
  await Hive.openBox('keyBox');

  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final String appVer = packageInfo.version;
  final String buildVer = packageInfo.buildNumber;

  appVersion = appVer;
  buildVersion = buildVer;

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const App(),
    ),
  );
}
