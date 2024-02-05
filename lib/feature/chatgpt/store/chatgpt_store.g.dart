// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatgpt_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatgptStore on _ChatgptStoreBase, Store {
  late final _$isFetchingAtom =
      Atom(name: '_ChatgptStoreBase.isFetching', context: context);

  @override
  bool get isFetching {
    _$isFetchingAtom.reportRead();
    return super.isFetching;
  }

  @override
  set isFetching(bool value) {
    _$isFetchingAtom.reportWrite(value, super.isFetching, () {
      super.isFetching = value;
    });
  }

  late final _$messagesAtom =
      Atom(name: '_ChatgptStoreBase.messages', context: context);

  @override
  ObservableList<Map<String, String>> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Map<String, String>> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$chatgptAPIAsyncAction =
      AsyncAction('_ChatgptStoreBase.chatgptAPI', context: context);

  @override
  Future<String> chatgptAPI(String prompt) {
    return _$chatgptAPIAsyncAction.run(() => super.chatgptAPI(prompt));
  }

  late final _$_ChatgptStoreBaseActionController =
      ActionController(name: '_ChatgptStoreBase', context: context);

  @override
  void _addMessage(String role, String content) {
    final _$actionInfo = _$_ChatgptStoreBaseActionController.startAction(
        name: '_ChatgptStoreBase._addMessage');
    try {
      return super._addMessage(role, content);
    } finally {
      _$_ChatgptStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFetching: ${isFetching},
messages: ${messages}
    ''';
  }
}
