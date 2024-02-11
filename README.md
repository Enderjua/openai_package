# ChatGPT , Whisper, Embeddings and DALL-E APIs are [added](#chat) to the can uses.

</br>
<p align="center">
<img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/m/Enderjua/openai_package">
<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/Enderjua/openai_package">
<img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/Enderjua/openai_package?style=social">
<img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/Enderjua/openai_package/dart.yml?label=tests">
<img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/Enderjua/openai_package/release.yml?label=build">
<img alt="GitHub" src="https://img.shields.io/github/license/Enderjua/openai_package">
<img alt="Pub Version" src="https://img.shields.io/pub/v/openai_package">
<img alt="Pub Likes" src="https://img.shields.io/pub/likes/openai_package">
<img alt="Pub Points" src="https://img.shields.io/pub/points/openai_package">
<img alt="Pub Popularity" src="https://img.shields.io/pub/popularity/openai_package">

</p>

</br>
 
<h3>Support this project to help more people benefit! You can contribute ⭐.</h3>

</br>
</br>


You can fulfill nearly all your API needs provided by OpenAI by using this project, which is open-source and free software, in your application. 


This package communicates with the API using HTTP requests. It's a straightforward package with simple usage. If you're new to Dart/Flutter, you won't have any difficulty using it in your application!


Feel free to use this package in your application, it's always ready to work without requiring updates, anytime, anywhere, the OpenAI APIs package
</br>
</br>

<i>Unofficial</i>
</br>
<i>OpenAI does not have any official Dart library.</I>

## ✨ Key Features

- Methods designed for ease of use, mirroring the OpenAI documentation precisely, and enhanced with additional features to optimize usage with the Dart Programming Language.
- Authorize once, utilize it anywhere and at any time within your application.
- User-friendly for developers.
- Not all OpenAI APIs sections are included in our package. Soon, all of them will be added
- Comprehensive examples/snippets provided for nearly all implemented features within the package, located in the `/example` folder.

## 👑 Code Progress (58 %)

- [x] [Authentication](#authentication)
- [x] [Chat (GPT)](#chat)
- [x] [Edits](#edits)
- [x] [Images](#images)
- [x] [Embeddings](#embeddings)
- [x] [Audio](#audio)
- [x] [Speech](#speech)
- [ ] [Models](#models)
- [ ] [Completions](#completions)
- [ ] [Moderation](#moderations)
- [ ] [Files](#files)
- [ ] [Fine-tunes](#fine-tunes)


## 💫 Testing Progress (40 %)

- [x] [Authentication](#authentication)
- [x] [Chat (GPT)](#chat)
- [x] [Images](#images)
- [x] [Audio](#audio)
- [x] [Speech](#speech)
- [ ] [Models](#models)
- [ ] [Completions](#completions)
- [ ] [Moderation](#moderations)
- [ ] [Files](#files)
- [ ] [Fine-tunes](#fine-tunes)
- [ ] [Edits](#edits)
- [ ] [Embeddings](#embeddings)

</br>

# 📜 Full Documentation:

For the full documentation on library [check here](https://pub.dev/documentation/openai_pacakge/latest/).

</br>

# 🟢 Usage

## Authentication

### API key

The OpenAI API utilizes API keys for authentication. You can obtain your account's API key by visiting the[API keys](https://platform.openai.com/account/api-keys) section of your account.

```dart
import 'package:openai_package/openai_package.dart';

// lib/main.dart
void main() {
  OpenAI openAi = OpenAI(apiKey: 'your_api_key', model: 'select_your_model');
  // ..
}
```

If there is no `apiKey` data provided, you will be prompted with a warning message to enter your `apiKey` data.

If you have an `apiKey` but it has expired or is invalid, you will receive an error message as the output from the OpenAI APIs

If there is no `model` specified, you will be prompted with a warning message to select your preferred model.

If you have specified a `model` but it is invalid or not supported, you will receive an error message indicating the issue


## Warning for Organizations

Unfortunately, the organization creation stage is not available in our package at the moment! We will add it with future updates.

[Learn More From Here.](https://platform.openai.com/docs/api-reference/authentication)


## Chat (GPT)

### Create chat completion

Provides a predicted completion for a chat message(s) based on the provided properties:


if your want used to `old` version:

```dart
  String result = await openAI.chat(version: 'old', prompt: 'hello world!');
  print(result);

  // for message in prompt:
  FormatMessage formatMessage = FormatMessage(result: result);
  String response = await formatMessage.getMessage();
  print(response);
}
```

and if your want used `new` version:
```dart
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

```

The `chat` method is used to interact with the OpenAI API for generating conversational responses. It takes various parameters to customize the behavior of the conversation.

### Parameters

- `version`: Specifies the version of the OpenAI API to use. Defaults to 'new'.
- `messages`: A list of previous messages in the conversation. Each message should be an instance of the `Message` class.
- `prompt`: The initial prompt to start the conversation.
- `maxTokens`: The maximum number of tokens to generate in the response. Defaults to 100.
- `temperature`: Controls the randomness of the response. Higher values lead to more randomness. Defaults to 0.3.
- `topP`: Controls the diversity of the response by sampling from the topP tokens. Defaults to 1.0.
- `n`: Specifies the number of responses to generate. Defaults to 1.
- `frequencyPenalty`: Applies a penalty to the frequency of tokens in the response. Defaults to 0.
- `logitBias`: A dictionary specifying logit biases for tokens.
- `logprobs`: Whether to include log probabilities in the response.
- `topLogprobs`: Specifies the number of log probabilities to include in the response.
- `presencePenalty`: Applies a penalty to the presence of tokens in the response.
- `responseFormat`: Specifies the format of the response. Can be 'json' or 'text'.
- `seed`: A seed value for generating random responses.
- `stop`: Specifies conditions to stop generating tokens.
- `stream`: Whether to stream responses as they are generated.
- `speed`: Controls the speed of the response generation.

  ### Usage Example

```dart
import 'package:openai_package/openai_package.dart';

void main() {
  // Initialize OpenAI instance
  OpenAI openAi = OpenAI(apiKey: 'your_api_key', model: 'gpt-3.5-turbo');

  // Define previous messages
  List<Message> messages = [
    Message(role: 'system', content: 'Hello, how can I assist you today?')
  ];

  // Generate response
  Future<String> response = openAi.chat(
    messages: messages,
    // for old version prompt: 'I need help with a programming problem.',
    maxTokens: 150,
    temperature: 0.7,
    n: 1,
    stream: false,
  );
print(response)
```

