// ignore_for_file: deprecated_member_use

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

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

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      _confettiStore.setConfettiFinished(true);
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  // final keyBox = Hive.openBox('apiKey');

  //hive box reference
  final _box = Hive.box('keyBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 70),
              Image.asset(
                'assets/png/api_key.png',
                height: 300,
              ),
              const Text(
                "Unlock the power! Enter your API key\nand let the magic happen.",
                style: AppTextStyle.gt18whitebold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: _apikey,
                    decoration: InputDecoration(
                      hintText: 'Enter your API key',
                      hintStyle: AppTextStyle.gt18black
                          .copyWith(color: AppColors.grey3),
                      fillColor: Colors.white,
                      filled: true,
                      errorStyle: AppTextStyle.gt18white
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
                    style: AppTextStyle.gt18black,
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
              ),
              const SizedBox(height: 50),
              Stack(
                alignment: Alignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.nblue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final value = _apikey.value.text;
                        _box.add(value);
                        _playConfetti();
                        _navigateToNextScreen();
                      }
                    },
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Dive in!",
                            style: AppTextStyle.gt18whitebold,
                          ),
                          const SizedBox(width: 10),
                          SvgPicture.asset(
                            'assets/svg/chevron_right.svg',
                            color: Colors.white,
                          )
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
            ],
          ),
        ),
      ),
    );
  }
}
