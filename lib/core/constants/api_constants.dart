import 'package:hive_flutter/hive_flutter.dart';

const chatgptAPIUrl = 'https://api.openai.com/v1/chat/completions';
const dalleAPIUrl = 'https://api.openai.com/v1/images/generations';
String apiKey = Hive.box('keyBox').get(0).toString();
// const apiKey = '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';
