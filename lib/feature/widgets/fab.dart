// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';

class FAB extends StatelessWidget {
  const FAB({required this.controller, required this.suffix, super.key});

  final TextEditingController controller;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: controller,
                  textInputAction: TextInputAction.done,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    hintText: "Message",
                    suffixIcon: suffix,
                    hintStyle:
                        AppTextStyle.gt16black.copyWith(color: AppColors.grey3),
                    fillColor: const Color.fromARGB(255, 35, 35, 35),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 35, 35, 35),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: AppColors.midBlue,
                      ),
                    ),
                  ),
                )),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.midBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: UnconstrainedBox(
                  child: SvgPicture.asset(
                    'assets/svg/send.svg',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
