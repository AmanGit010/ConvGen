import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';

class KeysScreen extends StatelessWidget {
  const KeysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/png/api_key.png',
            height: 300,
          ),
          const Text(
            "Unlock the power! Enter your API key\nand let the magic happen",
            style: AppTextStyle.gt18whitebold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lblue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text("Dive in!"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
