import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Mic {
  Function _fn;
  Mic(this._fn);
  SpeechToText _speechToText = SpeechToText();
  success(String status) {
    print("Status is $status");
  }

  fail(err) {
    print("Error is $err");
  }

  resultListener(SpeechRecognitionResult result) {
    String output =
        "RECO ${result.recognizedWords} - FINAL ${result.finalResult}";
    print("Output $output");
    _fn(result.recognizedWords);
  }

  loadSpeech() async {
    bool avaliable =
        await _speechToText.initialize(onStatus: success, onError: fail);
    if (avaliable) {
      _speechToText.listen(onResult: resultListener);
    }
  }
}
