// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainStore on _MainStoreBase, Store {
  late final _$isDarkModeAtom =
      Atom(name: '_MainStoreBase.isDarkMode', context: context);

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$indexAtom = Atom(name: '_MainStoreBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$lastWordsAtom =
      Atom(name: '_MainStoreBase.lastWords', context: context);

  @override
  String get lastWords {
    _$lastWordsAtom.reportRead();
    return super.lastWords;
  }

  @override
  set lastWords(String value) {
    _$lastWordsAtom.reportWrite(value, super.lastWords, () {
      super.lastWords = value;
    });
  }

  late final _$initSpeechToTextAsyncAction =
      AsyncAction('_MainStoreBase.initSpeechToText', context: context);

  @override
  Future<void> initSpeechToText() {
    return _$initSpeechToTextAsyncAction.run(() => super.initSpeechToText());
  }

  late final _$startListeningAsyncAction =
      AsyncAction('_MainStoreBase.startListening', context: context);

  @override
  Future<void> startListening() {
    return _$startListeningAsyncAction.run(() => super.startListening());
  }

  late final _$stopListeningAsyncAction =
      AsyncAction('_MainStoreBase.stopListening', context: context);

  @override
  Future<void> stopListening() {
    return _$stopListeningAsyncAction.run(() => super.stopListening());
  }

  late final _$_MainStoreBaseActionController =
      ActionController(name: '_MainStoreBase', context: context);

  @override
  void onSpeechResult(SpeechRecognitionResult result) {
    final _$actionInfo = _$_MainStoreBaseActionController.startAction(
        name: '_MainStoreBase.onSpeechResult');
    try {
      return super.onSpeechResult(result);
    } finally {
      _$_MainStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkMode: ${isDarkMode},
index: ${index},
lastWords: ${lastWords}
    ''';
  }
}
