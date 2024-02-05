// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../core/constants/styles.dart';
import '../../main/store/main_store.dart';
import '../../widgets/fab.dart';

class DalleScreen extends StatefulWidget {
  const DalleScreen({super.key});

  @override
  State<DalleScreen> createState() => _DalleScreenState();
}

class _DalleScreenState extends State<DalleScreen> {
  final TextEditingController _promptContr = TextEditingController();

  //Mainstore context
  late final store = context.read<MainStore>();

  //Speech to text
  SpeechToText speechToText = SpeechToText();
  String lastWords = '';

  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FAB(
        controller: _promptContr,
        suffix: GestureDetector(
          onTap: () async {
            if (await speechToText.hasPermission &&
                speechToText.isNotListening) {
              await startListening();
            } else if (speechToText.isListening) {
              await stopListening();
            } else {
              await initSpeechToText();
            }
          },
          child: speechToText.isListening
              ? const Icon(
                  Icons.stop,
                  color: Colors.redAccent,
                )
              : UnconstrainedBox(
                  child: SvgPicture.asset(
                    'assets/svg/voice.svg',
                    color: Colors.redAccent,
                    height: 25,
                  ),
                ),
        ),
      ),
      body: Column(
        children: [
          Text(
            'lastWords:\n',
            style: AppTextStyle.gt16whitebold,
          ),
          Text(
            lastWords,
            style: AppTextStyle.gt16whitebold,
          ),
        ],
      ),
    );
  }
}
