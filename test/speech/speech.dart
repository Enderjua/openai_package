import 'package:openai_package/openai_package.dart';

void main() {
  OpenAI openAI = OpenAI(
    apiKey: 'your_api_key',
    model: 'tts-1',
  );

  openAI.speech(input: 'this is a test function');


}