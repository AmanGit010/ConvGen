// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dalle_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DalleStore on _DalleStoreBase, Store {
  late final _$isCreatingAtom =
      Atom(name: '_DalleStoreBase.isCreating', context: context);

  @override
  bool get isCreating {
    _$isCreatingAtom.reportRead();
    return super.isCreating;
  }

  @override
  set isCreating(bool value) {
    _$isCreatingAtom.reportWrite(value, super.isCreating, () {
      super.isCreating = value;
    });
  }

  late final _$messagesAtom =
      Atom(name: '_DalleStoreBase.messages', context: context);

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

  late final _$dalleAPIAsyncAction =
      AsyncAction('_DalleStoreBase.dalleAPI', context: context);

  @override
  Future<String> dalleAPI(String prompt) {
    return _$dalleAPIAsyncAction.run(() => super.dalleAPI(prompt));
  }

  late final _$_DalleStoreBaseActionController =
      ActionController(name: '_DalleStoreBase', context: context);

  @override
  void _addMessage(String role, String content) {
    final _$actionInfo = _$_DalleStoreBaseActionController.startAction(
        name: '_DalleStoreBase._addMessage');
    try {
      return super._addMessage(role, content);
    } finally {
      _$_DalleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCreating: ${isCreating},
messages: ${messages}
    ''';
  }
}
