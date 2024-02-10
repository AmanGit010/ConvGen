// ignore_for_file: deprecated_member_use, avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../core/constants/api_constants.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';
import '../onboarding/store/keys_store.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final TextEditingController _apiKeyContr = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = context.read<KeysStore>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.borderg,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'Your API Key',
                      style: AppTextStyle.gt16whitebold.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Observer(builder: (_) {
                          return Expanded(
                            child: Form(
                              key: formKey,
                              child: TextFormField(
                                controller: _apiKeyContr,
                                decoration: InputDecoration(
                                  hintText: '${store.apiKey}',
                                  enabled: store.apiKey == '' ? true : false,
                                  hintStyle: AppTextStyle.gt16black
                                      .copyWith(color: AppColors.grey3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorStyle: AppTextStyle.gt16white
                                      .copyWith(color: Colors.redAccent),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 2.5,
                                      color: Colors.redAccent,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                validator: (value) {
                                  final RegExp regex =
                                      RegExp(r"^[A-Za-z0-9-]{50,}$");
                                  if (value!.isEmpty) {
                                    return 'Please enter your API key.';
                                  }
                                  if (!regex.hasMatch(value)) {
                                    return 'Please enter valid API key.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          );
                        }),
                        const SizedBox(width: 10),
                        Observer(builder: (_) {
                          return GestureDetector(
                            onTap: () {
                              if (store.apiKey != '') {
                                if (Hive.box('keyBox').containsKey(0) &&
                                    store.apiKey!.isNotEmpty) {
                                  Hive.box('keyBox').delete(0);
                                  store.apiKey = '';
                                  apiKey = '';
                                  _apiKeyContr.clear();
                                  // print(Hive.box('keyBox').get(0));
                                  // print(apiKey);
                                } else {
                                  // print('Empty');
                                }
                              } else {
                                if (formKey.currentState!.validate()) {
                                  Hive.box('keyBox').put(0, _apiKeyContr.text);
                                  store.apiKey = _apiKeyContr.text;
                                  apiKey = _apiKeyContr.text;
                                }
                                // print(store.apiKey);
                                // print(_apiKeyContr.text);
                              }
                              // print(Hive.box('keyBox').get(0));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: store.apiKey == ''
                                    ? AppColors.midBlue
                                    : Colors.redAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: store.apiKey == ''
                                    ? SvgPicture.asset(
                                        'assets/svg/check_square.svg',
                                        color: Colors.white,
                                      )
                                    : SvgPicture.asset(
                                        'assets/svg/delete.svg',
                                        color: Colors.black,
                                      ),
                              ),
                            ),
                          );
                        })
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
