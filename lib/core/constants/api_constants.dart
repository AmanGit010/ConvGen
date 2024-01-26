import 'package:hive_flutter/hive_flutter.dart';

const String api_url = '';
final String api_key = Hive.box('keyBox').get(0).toString();
