// ignore_for_file: avoid_positional_boolean_parameters

import 'package:mobx/mobx.dart';
part 'keys_store.g.dart';

class KeysStore = _KeysStoreBase with _$KeysStore;

abstract class _KeysStoreBase with Store {
  // ------------------ Confetti code ------------------------
  @observable
  bool isConfettiFinished = false;

  @action
  void setConfettiFinished(bool value) {
    isConfettiFinished = value;
  }
  // ---------------------------------------------------------
}
