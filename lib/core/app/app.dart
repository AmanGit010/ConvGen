import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../feature/main/store/main_store.dart';
import 'splash_screen.dart';
import 'theme/theme_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => MainStore(),
        )
      ],
      child: MaterialApp(
        theme: Provider.of<ThemeProvider>(context).themeData,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
