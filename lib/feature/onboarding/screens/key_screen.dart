// ignore_for_file: deprecated_member_use

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../main/main_screen.dart';
import '../store/keys_store.dart';

class KeysScreen extends StatefulWidget {
  const KeysScreen({super.key});

  @override
  State<KeysScreen> createState() => _KeysScreenState();
}

class _KeysScreenState extends State<KeysScreen> {
  late ConfettiController _confettiController;
  late KeysStore _confettiStore;
  final TextEditingController _apikey = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late final store = context.read<KeysStore>();
  final url = 'https://github.com/AmanGit010/ConvGen/blob/main/README.md';

  //Confetti code --------------------
  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
    _confettiStore = KeysStore();
  }

  void _playConfetti() {
    _confettiController.play();
    _confettiStore.setConfettiFinished(false);
  }
  //---------------------------------

  //Navigation function
  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      _confettiStore.setConfettiFinished(true);
      await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
        (route) => false,
      );
    }
  }
  //----------------------------------

  //Hive box refernce variable
  final _box = Hive.box('keyBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 70),
                Image.asset(
                  'assets/png/api_key.png',
                  height: 300,
                ),
                const Text(
                  "Unlock the power! Enter your API key\nand let the magic happen.",
                  style: AppTextStyle.gt16whitebold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: _apikey,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Enter your API key',
                      hintStyle: AppTextStyle.gt16black
                          .copyWith(color: AppColors.grey3),
                      fillColor: Colors.white,
                      filled: true,
                      errorStyle: AppTextStyle.gt16white
                          .copyWith(color: Colors.redAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2.5,
                          color: Colors.redAccent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    style: AppTextStyle.gt16black,
                    validator: (value) {
                      final RegExp regex = RegExp(r"^[A-Za-z0-9-]{50,}$");
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      launchUrlString(url);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "How to get an API Key? ",
                          style: AppTextStyle.gt16white.copyWith(fontSize: 14),
                        ),
                        Text(
                          "See here",
                          style: AppTextStyle.gt16whitebold
                              .copyWith(color: AppColors.midBlue, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          final value = _apikey.value.text;
                          _box.put(0, value);
                          // apiKey = value;
                          // print('Api: $apiKey');
                          // print('Hive: ${Hive.box('keyBox').get(0)}');
                          _playConfetti();
                          _navigateToNextScreen();
                        }
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.sizeOf(context).width * 0.4,
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
                              "Dive in!",
                              style: AppTextStyle.gt16whitebold,
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
                    Observer(builder: (context) {
                      if (!_confettiStore.isConfettiFinished) {
                        return ConfettiWidget(
                          confettiController: _confettiController,
                          blastDirectionality: BlastDirectionality.explosive,
                          emissionFrequency: 0.01,
                          gravity: 0.35,
                          colors: const [
                            Colors.red,
                            Colors.blue,
                            Colors.green,
                            Colors.yellow
                          ],
                        );
                      } else {
                        _navigateToNextScreen();
                        return Container();
                      }
                    }),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
