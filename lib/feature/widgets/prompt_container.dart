// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:typewritertext/typewritertext.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';

class PromptContainer extends StatelessWidget {
  const PromptContainer({required this.role, required this.content, super.key});

  final String role;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (role == 'user')
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.borderg,
              ),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'You',
                  style: AppTextStyle.gt16white,
                ),
              ),
            )
          else
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  'assets/svg/openai_logo.svg',
                  color: Colors.black,
                ),
              ),
            ),
          const SizedBox(width: 20),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.75,
            child: SelectionArea(
              child: TypeWriterText(
                maintainSize: false,
                text: Text(
                  content,
                  style: AppTextStyle.gt16white,
                ),
                duration: const Duration(milliseconds: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
