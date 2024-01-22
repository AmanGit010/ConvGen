import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app/app.dart';
import 'core/app/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const App(),
    ),
  );
}
