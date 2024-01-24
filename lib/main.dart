import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/app/app.dart';
import 'feature/app/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const App(),
    ),
  );
}
