import '../lib/openai_package.dart';
import '../lib/src/openai/import/importAi.dart';

void main() async {
  OpenAI.apiKey = 'your-key';
  OpenAI.model = 'gpt-4';
  OpenAI.organization = 'your-organization';
  // error OpenAI.connectionTimeout = 0;

  OpenAI client = OpenAI();

  List<Message>? message = [
    Message(role: 'user', content: 'nasılsın?'),
  ];

  // Nullable olmayan bir liste olarak tanımlandığı için doğrudan atama yapılabilir.
  // OpenAIEmbeddings result = await client.embeddings(input: 'metastresser.io');
  OpenAIChatMessage response = await client.chat(messages: message);

  print(response.message);
}
