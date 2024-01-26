// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keys_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KeysStore on _KeysStoreBase, Store {
  late final _$isConfettiFinishedAtom =
      Atom(name: '_KeysStoreBase.isConfettiFinished', context: context);

  @override
  bool get isConfettiFinished {
    _$isConfettiFinishedAtom.reportRead();
    return super.isConfettiFinished;
  }

  @override
  set isConfettiFinished(bool value) {
    _$isConfettiFinishedAtom.reportWrite(value, super.isConfettiFinished, () {
      super.isConfettiFinished = value;
    });
  }

  late final _$_KeysStoreBaseActionController =
      ActionController(name: '_KeysStoreBase', context: context);

  @override
  void setConfettiFinished(bool value) {
    final _$actionInfo = _$_KeysStoreBaseActionController.startAction(
        name: '_KeysStoreBase.setConfettiFinished');
    try {
      return super.setConfettiFinished(value);
    } finally {
      _$_KeysStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isConfettiFinished: ${isConfettiFinished}
    ''';
  }
}
