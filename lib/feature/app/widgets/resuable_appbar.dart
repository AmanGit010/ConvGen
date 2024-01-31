// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';

class ReusableAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ReusableAppbar(
      {required this.title, this.trailing, super.key, this.leading});

  final String title;
  final Widget? leading;
  final List<Widget>? trailing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.splashBlack,
      leading: leading,
      title: Text(title, style: AppTextStyle.gt16whitebold),
      centerTitle: true,
      actions: trailing,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
