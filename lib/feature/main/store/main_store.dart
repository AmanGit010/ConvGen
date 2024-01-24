import 'package:mobx/mobx.dart';
part 'main_store.g.dart';

class MainStore = _MainStoreBase with _$MainStore;

abstract class _MainStoreBase with Store {
  @observable
  bool isDarkMode = true;

  @observable
  int index = 0;
}
//dart run build_runner build --delete-conflicting-outputs 
