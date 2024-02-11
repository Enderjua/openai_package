import 'package:openai_package/openai_package.dart';

void main() async {
  OpenAI openAI = OpenAI(
    apiKey: 'your_api_key',
    model: 'dall-e-3',
  );

  String response = await openAI.generateImage(prompt: 'a cat', n: 1, size: '1024x1024');
  print(response);


}