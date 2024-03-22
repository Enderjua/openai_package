// ignore_for_file: unused_local_variable

import 'package:openai_package/openai_package.dart';
import 'package:openai_package/src/openai/import/importAi.dart'; //  you must add

void main() {
  // Initialize OpenAI instance
  OpenAI.apiKey = 'your-api-key';

  // Define previous messages
  List<Message> messages = [
    Message(role: 'system', content: 'Hello, how can I assist you today?')
  ];

  OpenAI openAi = OpenAI();

  // Generate response
  Future<OpenAIChatMessage> response = openAi.chat(
    messages: messages,
    // for old version prompt: 'I need help with a programming problem.',
    maxTokens: 150,
    temperature: 0.7,
    n: 1,
    stream: false,
  );
print(response.toString());

}