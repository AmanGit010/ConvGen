// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../../../core/constants/api_constants.dart';

part 'chatgpt_store.g.dart';

class ChatgptStore = _ChatgptStoreBase with _$ChatgptStore;

abstract class _ChatgptStoreBase with Store {
  @observable
  bool isFetching = false;

  @observable
  ObservableList<Map<String, String>> messages =
      ObservableList<Map<String, String>>.of([]);

  @action
  Future<String> chatgptAPI(String prompt) async {
    try {
      isFetching = true;
      _addMessage('user', prompt);
      final res = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(
          {'model': 'gpt-3.5-turbo', 'messages': messages},
        ),
      );

      if (res.statusCode == 200) {
        String respContent =
            jsonDecode(res.body)['choices'][0]['message']['content'].toString();
        respContent = respContent.trim();

        _addMessage('assistant', respContent);
        print(respContent);
        return respContent;
      }
      return 'An internal error occured!';
    } catch (e) {
      return e.toString();
    } finally {
      isFetching = false;
    }
  }

  @action
  void _addMessage(String role, String content) {
    messages.add({
      'role': role,
      'content': content,
    });
  }
}

//dart run build_runner build --delete-conflicting-outputs 