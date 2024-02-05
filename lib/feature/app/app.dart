// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../chatgpt/store/chatgpt_store.dart';
import '../main/store/main_store.dart';
import 'splash_screen.dart';
import 'theme/theme_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ChatgptStore(),
        ),
        Provider(
          create: (context) => MainStore(),
        ),
      ],
      child: MaterialApp(
        theme: Provider.of<ThemeProvider>(context).themeData.copyWith(
              splashColor: Colors.transparent,
              splashFactory: InkRipple.splashFactory,
              useMaterial3: true,
            ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
