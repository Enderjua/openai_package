import 'package:openai_package/openai_package.dart';

void main() async {
  OpenAI openAI = OpenAI(
    apiKey: 'your_api_key',
    model: 'whisper-1',
  );

  String response = await openAI.transcriptions(audioUrl: '/home/marijua/Masaüstü/all/software/dart/openai_package/test/transcriptions/audio.mp3');
  print(response);


}