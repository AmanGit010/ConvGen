import 'package:flutter/material.dart';

import '../../app/widgets/resuable_appbar.dart';

class DalleScreen extends StatelessWidget {
  const DalleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppbar(title: 'DALL·E', leadingOntap: () {}),
      body: const Column(
        children: [
          Text("Dalle screen"),
        ],
      ),
    );
  }
}
