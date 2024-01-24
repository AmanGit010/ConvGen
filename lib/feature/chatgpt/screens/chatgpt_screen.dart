import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/widgets/resuable_appbar.dart';
import '../../main/store/main_store.dart';

class ChatgptScreen extends StatelessWidget {
  const ChatgptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<MainStore>();
    return Scaffold(
      appBar: ReusableAppbar(title: 'ChatGPT', ontap: () {}),
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
