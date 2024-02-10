// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/app_info.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';
import '../app/widgets/resuable_appbar.dart';
import '../chatgpt/screens/chatgpt_screen.dart';
import '../dalle/screens/dalle_screen.dart';
import '../settings/settings_screen.dart';
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
    SettingsScreen(),
  ];

  late final store = context.read<MainStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: ReusableAppbar(
          // title: store.index == 0 ? 'ChatGPT' : 'DALL·E',
          title: store.index == 0
              ? 'ChatGPT'
              : store.index == 1
                  ? 'DALL·E'
                  : 'Settings',
          leading: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: UnconstrainedBox(
                child: SvgPicture.asset(
                  'assets/svg/menu.svg',
                  color: Colors.white,
                  height: 30,
                ),
              ),
            );
          }),
        ),
        drawer: _Drawer(store: store),
        body: Observer(
          builder: (context) {
            return pages[store.index];
          },
        ),
      );
    });
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    required this.store,
  });

  final MainStore store;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.splashBlack,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // height: MediaQuery.sizeOf(context).height * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.borderg,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: SvgPicture.asset(
                        'assets/svg/openai_logo.svg',
                        height: 40,
                      ),
                    ),
                    const Divider(color: Color.fromARGB(255, 93, 93, 93)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          _TabCont(
                            'ChatGPT',
                            () {
                              store.index = 0;
                              Navigator.pop(context);
                            },
                            0,
                            'assets/svg/openai_logo.svg',
                          ),
                          const SizedBox(height: 10),
                          _TabCont(
                            'DALL·E',
                            () {
                              store.index = 1;
                              Navigator.pop(context);
                            },
                            1,
                            'assets/svg/sparkle.svg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.borderg,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10)
                      .copyWith(top: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          store.index = 2;
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: store.index == 2
                                ? AppColors.midBlue
                                : const Color.fromARGB(255, 100, 100, 100),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/settings.svg',
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Settings',
                                  style: AppTextStyle.gt16whitebold,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/png/flutter_logo.png',
                              height: 15,
                            ),
                            Text(" • ",
                                style: AppTextStyle.gt16whitebold
                                    .copyWith(fontSize: 14)),
                            Text('Ver $appVersion',
                                style: AppTextStyle.gt16white
                                    .copyWith(fontSize: 14)),
                            Text(" • ",
                                style: AppTextStyle.gt16whitebold
                                    .copyWith(fontSize: 14)),
                            Text('Build $buildVersion',
                                style: AppTextStyle.gt16white
                                    .copyWith(fontSize: 14)), //siz16
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabCont extends StatelessWidget {
  const _TabCont(this.title, this.ontap, this.index, this.icon);

  final String title;
  final int index;
  final VoidCallback ontap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final store = context.read<MainStore>();
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color:
              store.index == 0 && index == 0 || store.index == 1 && index == 1
                  ? AppColors.midBlue
                  : const Color.fromARGB(255, 100, 100, 100),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                color: store.index == 0 && index == 0 ||
                        store.index == 1 && index == 1
                    ? Colors.white
                    : Colors.black,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: AppTextStyle.gt16whitebold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
