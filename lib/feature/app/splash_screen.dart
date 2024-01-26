import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../main/main_screen.dart';
import '../onboarding/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SvgPicture.asset(
        'assets/svg/openai_logo.svg',
        height: 90,
      ),
      backgroundColor: const Color(0xff0d0d0d),
      duration: 1500,
      nextScreen: Hive.box('keyBox').containsKey(0)
          ? const MainScreen()
          : const OnboardingScreen(),
    );
  }
}
