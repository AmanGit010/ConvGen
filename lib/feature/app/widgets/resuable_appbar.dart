// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';

class ReusableAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ReusableAppbar({required this.title, required this.ontap, super.key});

  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.splashBlack,
      leading: GestureDetector(
        onTap: ontap,
        child: UnconstrainedBox(
          child: SvgPicture.asset(
            'assets/svg/sidebar.svg',
            color: Colors.white,
          ),
        ),
      ),
      title: Text(title, style: AppTextStyle.gt18white),
      centerTitle: true,
      actions: const [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
