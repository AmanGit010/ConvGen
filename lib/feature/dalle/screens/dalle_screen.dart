// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/widgets/resuable_appbar.dart';
import '../../widgets/fab.dart';

class DalleScreen extends StatelessWidget {
  const DalleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _promptContr = TextEditingController();
    return Scaffold(
      bottomNavigationBar: FAB(
        controller: _promptContr,
        suffix: GestureDetector(
          onTap: () async {
            // if (await speechToText.hasPermission &&
            //     speechToText.isNotListening) {
            //   await startListening();
            // } else if (speechToText.isListening) {
            //   await stopListening();
            // } else {
            //   await initSpeechToText();
            // }
          },
          // child: speechToText.isListening
          //     ? const Icon(
          //         Icons.stop,
          //         color: Colors.redAccent,
          //       )
          //     : UnconstrainedBox(
          //         child: SvgPicture.asset(
          //           'assets/svg/voice.svg',
          //           color: Colors.redAccent,
          //           height: 25,
          //         ),
          //       ),
        ),
      ),
      body: const Column(
        children: [
          Text("Dalle screen"),
        ],
      ),
    );
  }
}
