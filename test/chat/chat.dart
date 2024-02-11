import 'package:openai_package/openai_package.dart';

void main() async {
  OpenAI openAI = OpenAI(
    apiKey: 'your_api_key',
    model: 'your_model',
  );

/// This code snippet demonstrates how to use the `openAI` package to perform a chat-based conversation.
/// It creates a list of messages, where each message has a role (system or user) and content.
/// The `openAI.chat` method is then called with the list of messages to initiate the chat.
/// The result of the chat is printed, and then the response is formatted using the `FormatMessage` class.
/// The formatted response is printed as well.
 List<Message> message = [
    Message(role: 'system', content: 'you are my help ai'),
    Message(role: 'user', content: 'I need help with my computer'),
  ];
  

  String result = await openAI.chat(messages: message);
  print(result);

  // for message in prompt:
  FormatMessage formatMessage = FormatMessage(result: result);
  String response = await formatMessage.getMessage();
  print(response);
}