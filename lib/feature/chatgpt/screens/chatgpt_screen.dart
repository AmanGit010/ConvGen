// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../main/store/main_store.dart';
import '../../widgets/fab.dart';
import '../../widgets/prompt_container.dart';
import '../store/chatgpt_store.dart';

class ChatgptScreen extends StatefulWidget {
  const ChatgptScreen({super.key});

  @override
  State<ChatgptScreen> createState() => _ChatgptScreenState();
}

class _ChatgptScreenState extends State<ChatgptScreen> {
  final TextEditingController _promptContr = TextEditingController();

  //Mainstore context
  late final store = context.read<MainStore>();
  late final chatgptStore = context.read<ChatgptStore>();

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
    // lastWords = '';
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
          onTap: ()
              // async
              {
            // if (await speechToText.hasPermission &&
            //     speechToText.isNotListening) {
            //   await startListening();
            // } else if (speechToText.isListening) {
            //   await stopListening();
            //   unawaited(chatgptStore.chatgptAPI(lastWords));
            //   print(chatgptStore.messages);
            // }
            // else {
            //   await initSpeechToText();
            // }
            Fluttertoast.showToast(msg: 'Speech to Text Coming Soon!');
          },
          child: speechToText.isListening
              // ? Text('yes') : Text('no'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const Text(
            //   'lastWords:\n',
            //   style: AppTextStyle.gt16whitebold,
            // ),
            // Text(
            //   lastWords,
            //   style: AppTextStyle.gt16whitebold,
            // ),
            Observer(builder: (_) {
              return ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 80),
                physics: const BouncingScrollPhysics(),
                itemCount: chatgptStore.messages.length,
                itemBuilder: (context, index) {
                  final message = chatgptStore.messages[index];
                  return PromptContainer(
                    role: message['role']!,
                    content: message['content']!,
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
