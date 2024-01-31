import 'package:hive_flutter/hive_flutter.dart';

const String apiUrl = '';
final String apiKey = Hive.box('keyBox').get(0).toString();
