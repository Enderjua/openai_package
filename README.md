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

## 👑 Code Progress (65 %)

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


## 💫 Testing Progress (45 %)

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
import 'package:openai_package/src/openai/import/importAi.dart'; //  you must add

// lib/main.dart
void main() {
  OpenAI.apiKey = 'your-api-key';
  // ..
}
```

If there is no `apiKey` data provided, you will be prompted with a warning message to enter your `apiKey` data.

If you have an `apiKey` but it has expired or is invalid, you will receive an error message as the output from the OpenAI APIs

If there is no `model` specified, you will be prompted with a warning message to select your preferred model.

If you have specified a `model` but it is invalid or not supported, you will receive an error message indicating the issue


## Setting an organization

If you want to configure an `organization` when using the OpenAI API, you can use the following code snippet:

```dart
// Enter the user's organization ID
OpenAI.organization = 'org-HZ3hl5Z89fEYVUufQOCzunok';
```




[Learn More From Here.](https://platform.openai.com/docs/api-reference/authentication)

## Settings a default request timeout

This library utilizes the `http` package for API requests, which comes with a default 30-second timeout. Any request exceeding this duration is canceled and throws an exception. To avoid unexpected cancellations, you can configure a custom default timeout:

```dart
// Set the default request timeout to 60 seconds (adjust as needed)
OpenAI.connectionTimeout = Duration(seconds: 60);
```

With this, your API calls will now wait up to 60 seconds for a response before raising an exception, allowing more breathing room for potentially slower `requests`.

### Key Points:
- Adjustable timeout: Set the desired response time using OpenAI.requestsTimeout.
- Duration format: Use the Duration class to specify the timeout in seconds (e.g., Duration(seconds: 45))
- Improved flexibility: Avoid unwanted cancellations for longer-running requests.

### Caution:
- Be mindful of exceeding reasonable timeouts, as it can significantly impact performance and responsiveness.
- Adjust the timeout value based on your specific use case and expected response times.

### Additional Notes:
- Consider implementing custom timeout logic for individual requests if needed.
- Monitor and manage performance implications of increased timeout values.


## Chat (GPT)

### Create chat completion

Provides a predicted completion for a chat message(s) based on the provided properties:


if your want used to `old` version:

```dart
  MessageData result = await openAI.chat(version: 'old', prompt: 'hello world!');
  print(result.message);


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
  

  MessageData result = await openAI.chat(messages: message);
  print(result.message);

  // if you want printing other information:
  print(result.model);

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
  Future<MessageData> response = openAi.chat(
    messages: messages,
    // for old version prompt: 'I need help with a programming problem.',
    maxTokens: 150,
    temperature: 0.7,
    n: 1,
    stream: false,  
  );
  print(response.toString());
}
```


## 🚀 OpenAI Embeddings

The `embeddings` method allows you to generate text embeddings using the OpenAI Embeddings API. Text embeddings are numerical representations of text data that capture the semantic meaning of the text.

### Parameters

- `input` (required): The input text for which you want to generate embeddings.
- `encodingFormat`: The encoding format of the input text. Defaults to 'float'.
- `dimensions`: The dimensions of the input text.
- `user`: The user ID associated with the request.
- `maxTokens`: The maximum number of tokens to generate in the response. Defaults to 100.
- `temperature`: Controls the randomness of the response. Higher values lead to more diverse embeddings. Defaults to 0.3.
- `topP`: Controls the diversity of the response by sampling from the topP tokens. Defaults to 1.0.
- `n`: Specifies the number of embeddings to generate. Defaults to 1.

### Usage

```dart
import 'package:openai_package/openai_package.dart';
import 'package:openai_package/src/openai/import/importAi.dart'; //  you must add

void main() async {
  // Initialize OpenAI instance
    OpenAI.apiKey = 'your-api-key';
    OpenAI.model = 'your-model';

  // Generate embeddings
  OpenAIEmbeddings embeddings = await openAi.embeddings(
    input: 'Text input for generating embeddings',
    encodingFormat: 'float',
    dimensions: 512,
    user: 'user_id',
    maxTokens: 100,
    temperature: 0.3,
    topP: 1.0,
    n: 1,
  );
  print(embeddings);
}
```

### Response

The response from the embeddings method is a string representing the `embeddings` generated for the input text.
```json
{
  "embeddings": [
    0.123,
    0.456,
    ...
  ]
}
```

### Notes

    Make sure to provide your API key when initializing the `OpenAI` instance.
    If the `apiKey` is not provided or is invalid, you will receive an error message as the output.
    Ensure that the specified model is supported by the Embeddings application, otherwise, an error will be thrown.


## 🖼️ OpenAI Image Generation

The `generateImage` method allows you to generate images using the OpenAI Image API. You can generate images based on prompts, edit existing images, and create variations of images.

### Parameters

- `prompt` (required): The prompt for generating or editing the image.
- `n` (required): The number of images to generate.
- `size` (required): The size of the image to generate.
- `edit`: Specifies whether to perform image editing. Defaults to `false`.
- `image`: The path to the image file when editing an image.
- `mask`: The path to the mask file when editing an image.
- `variations`: Specifies whether to generate variations of an image. Defaults to `false`.
- `response_format`: The desired format of the response. Defaults to "url".
- `style`: The style of the generated image. Defaults to "vivid".

### Usage

```dart
import 'package:openai_package/openai_package.dart';

void main() async {
  // Initialize OpenAI instance
    OpenAI.apiKey = 'your-api-key';
    OpenAI.model = 'your-model';

  // Generate image
  OpenAIGenerateImage generatedImage = await openAi.generateImage(
    prompt: 'Generate an image of a cat playing with a ball.',
    n: 1,
    size: '256x256',
    edit: false,
    variations: false,
    response_format: 'url',
    style: 'vivid',
  );
  print(generatedImage);
  // or
  print(generatedImage.url);
}
```
### Response

The response from the `generateImage` method is a string representing the generated image URL or the image data, depending on the response format specified.
```json
{
  "url": "https://generated_image_url.com/image.jpg"
}
```

### Notes
    Ensure to provide your API key when initializing the `OpenAI` instance.
    If the `apiKey` is not provided or is invalid, you will receive an error message as the output.
    The `edit` and `variations` parameters control the type of image generation operation to perform.
    The `image and mask` parameters are required when performing image editing.

## 🎙️ OpenAI Audio Transcription

The `transcriptions` method allows you to transcribe audio files using the OpenAI Audio API. You can transcribe audio files of various formats and languages.

### Parameters

- `audioUrl` (required): The URL of the audio file to be transcribed.
- `response_format`: The format of the response. Defaults to "text".
- `language`: The language of the audio file, if applicable.
- `prompt`: An optional prompt for the transcription.
- `temperature`: Controls the randomness of the generated text. Defaults to 0.3.
- `topP`: The cumulative probability for selecting the next token. Defaults to 1.0.
- `n`: The number of completions to generate. Defaults to 1.

### Usage

```dart
import 'package:openai_package/openai_package.dart';

void main() async {
  // Initialize OpenAI instance
    OpenAI.apiKey = 'your-api-key';
    OpenAI.model = 'your-model';

  // Transcribe audio
  String transcription = await openAi.transcriptions(
    audioUrl: 'https://example.com/audio.mp3',
    response_format: 'text',
    language: 'en',
    prompt: 'Transcribe the following audio clip:',
    temperature: 0.3,
    topP: 1.0,
    n: 1,
  );
  print(transcription);
}
```
### Response

The response from the `transcriptions` method is a string representing the transcribed text.

```json
{
  "transcription": "The transcribed text will be here."
}
```

### Notes
    Ensure to provide your API key when initializing the `OpenAI` instance.
    If the `apiKey` is not provided or is invalid, you will receive an error message as the output.
    The `audioUrl` parameter should be a direct URL to the audio file.
    Supported audio file formats include MP3, MP4, MPEG, MPG, M4A, WAV, and WebM.
    The `language` parameter is optional and can be used to specify the language of the audio file.
    The `prompt` parameter is optional and can be used to provide additional context for the transcription.

## 🎤 OpenAI Text-to-Speech (TTS)

The `speech` method allows you to convert text to speech using the OpenAI Text-to-Speech (TTS) API. You can customize various parameters such as the voice, speed, and output format.

### Parameters

- `input` (required): The text to be converted to speech.
- `voice`: The voice to use for the speech. Defaults to 'alloy'.
- `response_format`: The format of the speech output. Defaults to 'mp3'.
- `output`: The name of the output file where the speech will be saved. Defaults to 'speech.mp3'.
- `speed`: The speed of speech generation. Defaults to 1.0.

### Supported Models and Voices

The supported models and voices for the TTS application are as follows:

- Models: "tts-1", "tts-1-hd"
- Voices: "alloy", "echo", "fable", "onyx", "nova", "shimmer"

### Usage

```dart
import 'package:openai_package/openai_package.dart';

void main() async {
  // Initialize OpenAI instance
    OpenAI.apiKey = 'your-api-key';
    OpenAI.model = 'your-model';

  // Convert text to speech
  String result = await openAi.speech(
    input: 'Hello, how are you?',
    voice: 'alloy',
    response_format: 'mp3',
    output: 'speech.mp3',
    speed: 1.0,
  );
  print(result); // File downloaded to speech.mp3
}
```

### Response

The response from the `speech` method is a success message indicating that the file has been downloaded.

### Notes

    Ensure to provide your API key when initializing the `OpenAI` instance.
    If the `apiKey` is not provided or is invalid, you will receive an error message as the output.
    Supported response formats for speech application include "mp3", "opus", "aac", and "flac".
    The `output` parameter specifies the name of the file where the speech will be saved.


# OpenAI Formatted Responses

This document provides a summary of classes representing formatted responses from OpenAI API calls.

## `FormatTranscriptions`

A class that provides methods for formatting transcriptions.

### Constructor

- `FormatTranscriptions({Map<String, dynamic> result})`: Constructs a `FormatTranscriptions` object with the given `result`.

### Methods

- `generateRandomString(int length)`: Generates a random string of the specified length.
- `writeJsonToFile(Map<String, dynamic> jsonData)`: Writes the given JSON data to a file and returns the file name.


## Want to Contribute?

Your help is invaluable in improving this project for the benefit of the community. Here's how you can contribute:

- **Documentation:** Take a moment to document any undocumented classes, properties, or methods. Your insights can help other developers understand the project better.
- **Code Refactoring:** While code refactoring is primarily the responsibility of the project maintainer, your suggestions for improvements are always welcome.
- **Code Review:** If you spot opportunities for optimizing code or implementing better solutions, please share your insights.
- **Sample Use Cases:** If you've tried any use cases or examples and want to share them, feel free to contribute them to the `examples/` directory.
- **Stay Updated:** Keep an eye out for any updates in the API, Dart, relevant packages, or Flutter that could enhance this project.
- **Donations:** Consider supporting the project with a donation. Your contributions help sustain and improve the project over time.

Your contributions, no matter how small, make a difference in making this project better for everyone. Thank you for your support!
