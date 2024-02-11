// ignore_for_file: unused_local_variable

import 'package:openai_package/openai_package.dart';
import 'package:openai_package/src/openai/import/import.dart';

void main() async {
  // Create an instance of the OpenAI client
  OpenAI client = OpenAI(apiKey: 'YOUR_API_KEY', model: 'gpt-3.5-turbo');

  List<Message> message = [
    Message(role: '', content: ''),
  ];

  // Call the API to generate text
  String prompt = 'Once upon a time';
  int maxTokens = 100;
  String generatedText = await client.chat(messages: message);

  // Print the generated text
  print(generatedText);
}
