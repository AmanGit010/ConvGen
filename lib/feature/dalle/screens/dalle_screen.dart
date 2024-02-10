// ignore_for_file: deprecated_member_use, avoid_catches_without_on_clauses

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../widgets/fab.dart';
import '../store/dalle_store.dart';

class DalleScreen extends StatefulWidget {
  const DalleScreen({super.key});

  @override
  State<DalleScreen> createState() => _DalleScreenState();
}

class _DalleScreenState extends State<DalleScreen> {
  final TextEditingController _promptContr = TextEditingController();

  //Mainstore context
  late final dalleStore = context.read<DalleStore>();

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
          onTap: ()
              // async
              {
            // if (await speechToText.hasPermission &&
            //     speechToText.isNotListening) {
            //   await startListening();
            // } else if (speechToText.isListening) {
            //   await stopListening();
            // } else {
            //   await initSpeechToText();
            // }
            Fluttertoast.showToast(msg: 'Speech to Text Coming Soon!');
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
                itemCount: dalleStore.messages.length,
                itemBuilder: (context, index) {
                  final message = dalleStore.messages[index];
                  // print(dalleStore.messages);
                  return _PromptContainer(
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

class _PromptContainer extends StatelessWidget {
  const _PromptContainer({required this.role, required this.content});

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
          if (role == 'user')
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.75,
              child: SelectionArea(
                child: Text(
                  content,
                  style: AppTextStyle.gt16white,
                ),
              ),
            )
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(content),
            )
        ],
      ),
    );
  }
}

// Future<void> _downloadImage() async {
//   try {
//     await ImageDownloader.downloadImage(
//         'https://fastly.picsum.photos/id/797/536/354.jpg?hmac=n_-3dZZJdk4lSEk9sES6RNCndoYWXQTwPBif0YSZjrQ',
//         destination: AndroidDestinationType.custom(
//             directory: '/storage/emulated/0/Download')
//         // ..subDirectory('custom/sample.jpg'),
//         );
//   } catch (e) {
//     Text('Error: $e');
//   } finally {
//     await Fluttertoast.showToast(msg: 'Download successful!');
//   }
// }
