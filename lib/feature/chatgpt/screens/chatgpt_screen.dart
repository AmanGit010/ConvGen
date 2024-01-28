import 'package:flutter/material.dart';

import '../../app/widgets/resuable_appbar.dart';

class ChatgptScreen extends StatelessWidget {
  const ChatgptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppbar(title: 'ChatGPT', leadingOntap: () {}),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Chatgpt screen",
          )
        ],
      ),
    );
  }
}
