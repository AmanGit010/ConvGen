import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../core/app/theme/theme_provider.dart';
import 'store/main_store.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final store = context.read<MainStore>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(builder: (_) {
            return GestureDetector(
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
                store.isDarkMode = !store.isDarkMode;
              },
              child: Icon(
                Icons.dark_mode,
                color: store.isDarkMode == true ? Colors.white : Colors.black,
              ),
            );
          })
        ],
      ),
    );
  }
}
