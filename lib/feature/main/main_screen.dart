// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';
import '../chatgpt/screens/chatgpt_screen.dart';
import '../dalle/screens/dalle_screen.dart';
import 'store/main_store.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //List for all the required bottom nav screens
  final pages = [
    const ChatgptScreen(),
    const DalleScreen(),
  ];

  //Mainstore context
  late final store = context.read<MainStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: AppColors.splashBlack,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 20,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Observer(
            builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      store.index = 0;
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/openai_logo.svg',
                          color: store.index == 0
                              ? AppColors.lightBlue
                              : AppColors.grey3,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'CHATGPT',
                          style: AppTextStyle.gt18black.copyWith(
                              fontSize: 14,
                              color: store.index == 0
                                  ? Colors.white
                                  : AppColors.grey3),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      store.index = 1;
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/sparkle.svg',
                          color: store.index == 1
                              ? AppColors.lightBlue
                              : AppColors.grey3,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'DALL·E',
                          style: AppTextStyle.gt18black.copyWith(
                              fontSize: 14,
                              color: store.index == 1
                                  ? Colors.white
                                  : AppColors.grey3),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      body: Observer(
        builder: (context) {
          return pages[store.index];
        },
      ),
    );
  }
}
