import 'package:mobx/mobx.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
part 'main_store.g.dart';

class MainStore = _MainStoreBase with _$MainStore;

abstract class _MainStoreBase with Store {
  @observable
  bool isDarkMode = true;

  //Nav bar index
  @observable
  int index = 0;

  // Speech-to-text code -------------
  SpeechToText speechToText = SpeechToText();

  @observable
  String lastWords = '';

  @action
  Future<void> initSpeechToText() async {
    await speechToText.initialize();
  }

  @action
  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
  }

  @action
  Future<void> stopListening() async {
    await speechToText.stop();
  }

  @action
  void onSpeechResult(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;
  }
}
//dart run build_runner build --delete-conflicting-outputs 
