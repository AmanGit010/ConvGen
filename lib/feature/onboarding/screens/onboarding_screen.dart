// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gif/gif.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import 'key_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBlack,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Gif(
                image: const AssetImage('assets/gif/secure.gif'),
                fps: 60,
                autostart: Autostart.once,
              ),
              const SizedBox(height: 20),
              const Text('Feel secure!\n', style: AppTextStyle.gt18whitebold),
              Text(
                'Your API key is stored locally on your device, safeguarding your privacy as you dive into limitless possibilities.',
                style: AppTextStyle.gt18white.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KeysScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.midBlue,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Continue",
                        style: AppTextStyle.gt18whitebold,
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        'assets/svg/chevron_right.svg',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
