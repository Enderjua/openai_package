import 'import/import.dart';
import 'import/importAi.dart';
import 'package:http/http.dart' as http;

class OpenAI {
  static String apiKey = '';
  static String model = '';
  static String organization = '';
  static int connectionTimeout = 30;

  String apiUrl = "https://api.openai.com/v1/chat/completions";

  /// Creates a new instance of the OpenAI class.
  ///
  /// The [apiKey] parameter is the API key used for authentication.
  /// The [model] parameter specifies the model to be used for the OpenAI API.
  /// The [organization] parameter is an optional parameter that specifies the organization associated with the API key.
  OpenAI() {
    /// Validates the 'model' parameter and prints a warning message if it is invalid.
    /// Accepted values for the 'model' parameter are:
    /// - 'gpt-4-0125-preview'
    /// - 'gpt-4-turbo-preview'
    /// - 'gpt-4-1106-preview'
    /// - 'gpt-4-vision-preview'
    /// - 'gpt-4'
    /// - 'gpt-4-0314'
    /// - 'gpt-4-0613'
    /// - 'gpt-4-32k'
    /// - 'gpt-4-32k-0314'
    /// - 'gpt-4-32k-0613'
    /// - 'gpt-3.5-turbo'
    /// - 'gpt-3.5-turbo-16k'
    /// - 'gpt-3.5-turbo-0301'
    /// - 'gpt-3.5-turbo-0613'
    /// - 'gpt-3.5-turbo-1106'
    /// - 'gpt-3.5-turbo-16k-0613'
    /// - 'ft:gpt-3.5-turbo:my-org:custom_suffix:id'
    /// - 'text-embedding-ada-002'
    /// - 'text-embedding-3-small'
    /// - 'text-embedding-3-large'
    /// - 'whisper-1'
    /// - 'dall-e-3'
    /// - 'dall-e-2'
    /// - 'tts-1'
    /// - 'tts-1-hd'
    ///
    /// If the 'model' parameter is invalid, a warning message is printed and the program exits with code 1.
    if (!_isValidModel(model)) {
      print("WARNING: Invalid 'model' parameter. Accepted values are: "
          "'gpt-4-0125-preview', 'gpt-4-turbo-preview', 'gpt-4-1106-preview', "
          "'gpt-4-vision-preview', 'gpt-4', 'gpt-4-0314', 'gpt-4-0613', "
          "'gpt-4-32k', 'gpt-4-32k-0314', 'gpt-4-32k-0613', 'gpt-3.5-turbo', "
          "'gpt-3.5-turbo-16k', 'gpt-3.5-turbo-0301', 'gpt-3.5-turbo-0613', "
          "'gpt-3.5-turbo-1106', 'gpt-3.5-turbo-16k-0613', 'ft:gpt-3.5-turbo:my-org:custom_suffix:id', "
          "'text-embedding-ada-002', 'text-embedding-3-small', 'text-embedding-3-large', 'whisper-1', 'dall-e-3', 'dall-e-2', 'tts-1', 'tts-1-hd'.");

      exit(1);
    }
  }

  set fileWriteAsBytes(
      Future<Null> Function(String path, List<int> bytes,
              {bool flush, FileMode mode})
          fileWriteAsBytes) {}

  /// Checks if the given [model] is a valid model.
  ///
  /// Returns `true` if the [model] is one of the valid models listed in [validModels],
  /// otherwise returns `false`.
  bool _isValidModel(String model) {
    final validModels = [
      "gpt-4-0125-preview",
      "gpt-4-turbo-preview",
      "gpt-4-1106-preview",
      "gpt-4-vision-preview",
      "gpt-4",
      "gpt-4-0314",
      "gpt-4-0613",
      "gpt-4-32k",
      "gpt-4-32k-0314",
      "gpt-4-32k-0613",
      "gpt-3.5-turbo",
      "gpt-3.5-turbo-16k",
      "gpt-3.5-turbo-0301",
      "gpt-3.5-turbo-0613",
      "gpt-3.5-turbo-1106",
      "gpt-3.5-turbo-16k-0613",
      "ft:gpt-3.5-turbo:my-org:custom_suffix:id",
      "text-embedding-ada-002",
      "text-embedding-3-small",
      "text-embedding-3-large",
      "whisper-1",
      "dall-e-3",
      "dall-e-2",
      "tts-1",
      "tts-1-hd"
    ];

    return validModels.contains(model);
  }

  /// Represents a request to convert text to speech using OpenAI.
  ///
  /// The [input] parameter is the text to be converted to speech.
  /// The [voice] parameter specifies the voice to be used for the speech. The default value is 'alloy'.
  /// The [response_format] parameter specifies the format of the speech response. The default value is 'mp3'.
  /// The [output] parameter specifies the file name for the speech output. The default value is 'speech.mp3'.
  /// The [speed] parameter specifies the speed of the speech. The default value is 1.0.
  ///
  /// Returns a Future that completes with the speech output.

  Future<String> speech(
      {required String input,
      String voice = 'alloy',
      String response_format = 'mp3',
      String output = 'speech.mp3',
      double speed = 1.0}) async {
    /// Validates if the given [model] is supported by the speech application.
    /// Throws an [ArgumentError] if the [model] is not supported.
    ///
    /// [modelValues] is a list of supported model values.
    /// [model] is the model to be checked.
    ///
    /// Example usage:
    /// ```dart
    /// List<String> modelValues = [
    ///   "tts-1",
    ///   "tts-1-hd",
    /// ];
    ///
    /// validateModel(modelValues, model) {
    ///   if (!modelValues.contains(model)) {
    ///     throw ArgumentError('Speech application does not accept model $model');
    ///   }
    /// }
    /// ```
    List<String> modelValues = [
      "tts-1",
      "tts-1-hd",
    ];

    if (!modelValues.contains(model)) {
      throw ArgumentError('Speech application does not accept model $model');
    }

    /// Validates if the given [voice] is supported by the speech application.
    /// Throws an [ArgumentError] if the [voice] is not supported.
    ///
    /// [voiceValues] is a list of supported voice values.
    ///
    /// Example usage:
    /// ```dart
    /// List<String> voiceValues = [
    ///   "alloy",
    ///   "echo",
    ///   'fable',
    ///   'onyx',
    ///   'nova',
    ///   'shimmer'
    /// ];
    ///
    /// String voice = 'echo';
    ///
    /// if (!voiceValues.contains(voice)) {
    ///   throw ArgumentError('Speech application does not accept voice $voice');
    /// }
    /// ```
    List<String> voiceValues = [
      "alloy",
      "echo",
      'fable',
      'onyx',
      'nova',
      'shimmer'
    ];
    if (!voiceValues.contains(voice)) {
      throw ArgumentError('Speech application does not accept voice $voice');
    }

    /// Validates the response format for a speech application.
    ///
    /// Checks if the given [response_format] is a valid format for speech application.
    /// If the format is not valid, an [ArgumentError] is thrown with a descriptive error message.
    ///
    /// The valid response formats for speech application are: "mp3", "opus", "aac", and "flac".
    ///
    /// Throws [ArgumentError] if [response_format] is not a valid format.
    List<String> responseValues = [
      "mp3",
      "opus",
      'aac',
      'flac',
    ];
    if (!responseValues.contains(response_format)) {
      throw ArgumentError(
          'Speech application does not accept response format $response_format');
    }

    /// Sends a request to the OpenAI API to convert text to speech.
    ///
    /// The [url] variable stores the endpoint URL for the speech API.
    /// The [headers] variable contains the necessary authorization and content-type headers.
    /// The [body] variable is a JSON-encoded object that includes the model, input, voice, speed, and response format.
    ///
    /// Example usage:
    /// ```dart
    /// var url = 'https://api.openai.com/v1/audio/speech';
    /// var headers = {
    ///   'Authorization': 'Bearer $apiKey',
    ///   'Content-Type': 'application/json',
    /// };
    /// var body = jsonEncode({
    ///   "model": model,
    ///   "input": input,
    ///   "voice": voice,
    ///   "speed": speed,
    ///   "response_format": response_format,
    /// });
    /// ```
    var url = 'https://api.openai.com/v1/audio/speech';
    var headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };
    if (organization != '') {
      headers['OpenAI-Organization'] = organization;
    }
    var body = jsonEncode({
      "model": model,
      "input": input,
      "voice": voice,
      "speed": speed,
      "response_format": response_format,
    });

    /// Sends a POST request to the specified [url] with the given [headers] and [body].
    /// If the server returns a 200 OK response, the response body is written to a file specified by [output].
    /// Returns a success message if the file is downloaded successfully.
    /// Throws an exception if the server returns an unexpected response.
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, then write the body to a file.
      await File(output).writeAsBytes(response.bodyBytes);
      return 'File downloaded to speech.mp3';
    } else {
      // If the server returns an unexpected response, then throw an exception.
      throw Exception('Failed to download file: ${response.statusCode}');
    }
  }

  /// Represents the parameters for generating text from audio using OpenAI.
  ///
  /// The [audioUrl] is the required URL of the audio file.
  /// The [response_format] specifies the format of the response (default is "text").
  /// The [language] specifies the language of the audio file.
  /// The [prompt] is an optional prompt to provide context for the generated text.
  /// The [temperature] controls the randomness of the generated text (default is 0.3).
  /// The [topP] controls the diversity of the generated text (default is 1.0).
  /// The [n] specifies the number of text completions to generate (default is 1).

  Future<String> transcriptions({
    required String audioUrl,
    String? response_format = "text",
    String? language,
    String? prompt,
    double temperature = 0.3,
    double topP = 1.0,
    int n = 1,
  }) async {
    // Desteklenen dosya uzantıları
    List<String> supportedExtensions = [
      'mp3',
      'mp4',
      'mpeg',
      'mpga',
      'm4a',
      'wav',
      'webm'
    ];

    // audioUrl'in uzantısını al
    String fileExtension = audioUrl.split('.').last.toLowerCase();

    if (supportedExtensions.contains(fileExtension)) {
      // Desteklenen uzantı

      if (model != "whisper-1") {
        throw ArgumentError(
            "Transcriptions application does not accept model $model");
      } else {
        /// Sends a POST request to the OpenAI API to transcribe audio.
        ///
        /// The [apiKey] is the authorization token for accessing the API.
        /// The [audioUrl] is the URL of the audio file to be transcribed.
        /// The [model] specifies the language model to use for transcription.
        /// The [response_format] specifies the format of the response.
        /// The [temperature] controls the randomness of the generated text.
        /// The [topP] is the cumulative probability for selecting the next token.
        /// The [n] specifies the number of completions to generate.
        /// The [language] is an optional parameter to specify the language of the audio.
        /// The [prompt] is an optional parameter to provide a prompt for the transcription.
        ///
        /// Returns the transcription result as a string.
        var request = http.MultipartRequest('POST',
            Uri.parse('https://api.openai.com/v1/audio/transcriptions'));

        request.headers.addAll({
          'Authorization': 'Bearer $apiKey',
        });
        if (organization != '') {
          request.headers.addAll({
            'OpenAI-Organization': organization,
          });
        }

        request.files.add(await http.MultipartFile.fromPath(
          'file',
          '$audioUrl',
          contentType: MediaType('audio', 'mpeg'),
        ));

        request.fields['model'] = '$model';
        request.fields['response_format'] = '$response_format';
        request.fields['temperature'] = '$temperature';
        request.fields['top_p'] = '$topP';
        request.fields['n'] = '$n';
        if (language != null) {
          request.fields['language'] = '$language';
        }
        if (prompt != null) {
          request.fields['prompt'] = '$prompt';
        }

        var response = await request.send();
        http.Response fromStream = await http.Response.fromStream(response);
        return fromStream.body;
      }
    } else {
      // Desteklenmeyen uzantı hatası
      throw ArgumentError('Unsupported file extension: $fileExtension');
    }
  }

  /// Represents the parameters for generating text using OpenAI.
  ///
  /// The [prompt] is the input text used to generate the output.
  /// The [n] specifies the number of completions to generate.
  /// The [size] determines the maximum length of the generated text.
  /// The [edit] flag indicates whether the prompt should be editable.
  /// The [image] is an optional image prompt.
  /// The [mask] is an optional mask for the prompt.
  /// The [variations] flag indicates whether to generate multiple variations of the completion.
  /// The [response_format] specifies the format of the generated output.
  /// The [style] determines the style of the generated text.

  Future<String> generateImage({
    required String prompt,
    required int n,
    required String size,
    bool edit = false,
    String? image,
    String? mask,
    bool variations = false,
    String response_format = "url",
    String style = "vivid",
  }) async {
    /// Sets the API URL based on the provided parameters.
    ///
    /// If [edit] is true, sets the API URL for image editing using the [model] "dall-e-2".
    /// If [variations] is true, sets the API URL for image variations using the [model] "dall-e-2".
    /// If neither [edit] nor [variations] is true, sets the API URL for image generation using the [model] "dall-e-3" or "dall-e-2".
    /// Throws an [ArgumentError] if the [model] is invalid for the corresponding operation.
    if (edit) {
      if (model != "dall-e-2") {
        throw ArgumentError('Invalid model for editing: $model');
      }
      apiUrl = "https://api.openai.com/v1/images/edits";
    } else if (variations) {
      if (model != "dall-e-2") {
        throw ArgumentError('Invalid model for variations: $model');
      }
      apiUrl = "https://api.openai.com/v1/images/variations";
    } else {
      if (model != "dall-e-3" && model != "dall-e-2") {
        throw ArgumentError('Invalid model for image generation: $model');
      }
      apiUrl = "https://api.openai.com/v1/images/generations";
    }

    /// Creates the headers and body for the OpenAI API request.
    ///
    /// The headers include the content type and authorization token.
    /// The body includes the model, prompt, n, size, response format, and style.
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    if (organization != '') {
      headers['OpenAI-Organization'] = organization;
    }

    Map<String, dynamic> body = {
      "model": model,
      "prompt": prompt,
      "n": n,
      "size": size,
      "response_format": response_format,
      "style": style,
    };

    if (edit == false && variations == false) {
      /// Sends a POST request to the specified API endpoint with the given headers and body.
      ///
      /// The [apiUrl] parameter represents the URL of the API endpoint.
      /// The [headers] parameter contains the headers to be included in the request.
      /// The [body] parameter is the JSON-encoded request body.
      ///
      /// Returns the response body if the request is successful (status code 200).
      /// Otherwise, throws an exception with the corresponding status code.
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to generate image: ${response.statusCode}');
      }
    } else if (edit == false && variations == true) {
      /// Sends a POST request to the OpenAI API with the provided parameters.
      ///
      /// The [apiUrl] is the URL of the OpenAI API.
      /// The [apiKey] is the authorization token for accessing the API.
      /// The [image] is the path to the image file to be uploaded.
      /// The [model] is the name of the model to use for processing the request.
      /// The [response_format] is the desired format of the response.
      /// The [n] is the number of responses to generate.
      /// The [size] is the size of the response.
      ///
      /// Returns the response body as a string if the request is successful.
      /// Otherwise, throws an exception.
      final request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..headers['Authorization'] = 'Bearer $apiKey'
        ..files
            .add(await http.MultipartFile.fromPath('image', image.toString()))
        ..fields['model'] = model
        ..fields['response_format'] = response_format
        ..fields['n'] = n.toString()
        ..fields['size'] = size;

      final response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to generate image: ${response.statusCode}');
      }
    } else if (edit == true && variations == false) {
      /// Sends a POST request to the OpenAI API to generate an image using the provided parameters.
      ///
      /// The [apiKey] is used for authentication with the OpenAI API.
      /// The [image] and [mask] are file paths to the image and mask files respectively.
      /// The [model] is the name of the model to use for image generation.
      /// The [prompt] is the text prompt to provide to the model.
      /// The [n] is the number of images to generate.
      /// The [size] is the size of the generated image.
      ///
      /// Returns the generated image as a string if the request is successful.
      /// Throws an exception with the corresponding status code if the request fails.
      final request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..headers['Authorization'] = 'Bearer $apiKey'
        ..files
            .add(await http.MultipartFile.fromPath('image', image.toString()))
        ..files.add(await http.MultipartFile.fromPath('mask', mask.toString()))
        ..fields['model'] = model
        ..fields['prompt'] = prompt
        ..fields['n'] = n.toString()
        ..fields['size'] = size;

      final response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to generate image: ${response.statusCode}');
      }
    } else if (edit == true && variations == true) {
      throw ArgumentError(
          'Invalid parameters for image generation: edit and variations cannot be true at the same time');
    } else {
      throw ArgumentError('Invalid parameters for image generation');
    }
  }

  /// Represents the parameters for generating text using the OpenAI API.
  ///
  /// The [input] parameter is the prompt or starting text for text generation.
  /// The [encodingFormat] parameter specifies the format of the input text, with the default value being 'float'.
  /// The [dimensions] parameter specifies the number of dimensions for the generated text.
  /// The [user] parameter is an optional identifier for the user.
  /// The [maxTokens] parameter specifies the maximum number of tokens to generate.
  /// The [temperature] parameter controls the randomness of the generated text, with lower values producing more focused output.
  /// The [topP] parameter controls the diversity of the generated text, with lower values producing more focused output.
  /// The [n] parameter specifies the number of text completions to generate.

  Future<OpenAIEmbeddings> embeddings({
    required String input,
    String encodingFormat = 'float',
    int? dimensions,
    String? user,
    double temperature = 0.3,
    double topP = 1.0,
    int n = 1,
  }) async {
    /// Sets the API URL for OpenAI embeddings.
    ///
    /// The [apiUrl] parameter should be a valid URL for the OpenAI embeddings API.
    /// By default, it is set to "https://api.openai.com/v1/embeddings".
    ///
    /// Example:
    /// ```dart
    /// apiUrl = "https://api.openai.com/v1/embeddings";
    /// ```
    ///
    /// Throws an [ArgumentError] if the specified [model] is not supported.
    /// The [model] parameter should be one of the supported model values:
    /// - "text-embedding-ada-002"
    /// - "text-embedding-3-small"
    /// - "text-embedding-3-large"
    ///
    /// Example:
    /// ```dart
    /// List<String> modelValues = [
    ///   "text-embedding-ada-002",
    ///   "text-embedding-3-small",
    ///   "text-embedding-3-large",
    /// ];
    ///
    /// if (!modelValues.contains(model)) {
    ///   throw ArgumentError('Embeddings application does not accept model $model');
    /// }
    /// ```
    ///
    /// Note: This code snippet assumes that the `apiUrl` and `model` variables are defined.
    apiUrl = "https://api.openai.com/v1/embeddings";

    List<String> modelValues = [
      "text-embedding-ada-002",
      "text-embedding-3-small",
      "text-embedding-3-large",
    ];

    if (!modelValues.contains(model)) {
      throw ArgumentError(
          'Embeddings application does not accept model $model');
    }

    /// Creates the request body with the specified parameters.
    ///
    /// The [model] parameter specifies the model to use.
    /// The [input] parameter specifies the input text.
    /// The [maxTokens] parameter specifies the maximum number of tokens to generate.
    /// The [temperature] parameter controls the randomness of the output.
    /// The [topP] parameter controls the diversity of the output.
    /// The [n] parameter specifies the number of completions to generate.
    /// The [encodingFormat] parameter specifies the encoding format of the input text.
    /// The [dimensions] parameter specifies the dimensions of the input text.
    /// The [user] parameter specifies the user ID.
    ///
    /// Returns a map representing the request body.
    // Parametreleri oluştur
    Map<String, dynamic> requestBody = {
      "model": model,
      "input": input,
      "temperature": temperature,
      "top_p": topP,
      "n": n,
      "encoding_format": encodingFormat,
    };

    if (dimensions != null) {
      requestBody['dimensions'] = dimensions;
    }

    if (user != null) {
      requestBody['user'] = user;
    }

    /// Sends a POST request to the specified API endpoint with the given request body.
    ///
    /// The [requestBody] is encoded as JSON and added to the request body.
    /// The [apiUrl] is the URL of the API endpoint.
    /// The [apiKey] is the authorization token used for authentication.
    ///
    /// Returns the response body as a string.
    final encodedBody = utf8.encode(jsonEncode(requestBody));

    // Creates a new HttpClient object
    var httpClient = HttpClient();

    // Sets the connection timeout in seconds (defaults to 30 seconds)
    httpClient.connectionTimeout = Duration(seconds: connectionTimeout);

    final request = await httpClient.postUrl(Uri.parse(apiUrl));
    request.headers.set('Content-Type', 'application/json; charset=utf-8');
    request.headers.set('Authorization', 'Bearer $apiKey');
    if (organization != '') {
      request.headers.set('OpenAI-Organization', organization);
    }
    request.add(encodedBody);

    final httpResponse = await request.close();
    String responseBody = await utf8.decodeStream(httpResponse);

    Future<OpenAIEmbeddings> formatEmbeddings =
        OpenAIEmbeddings.fetchData(responseBody);

    return formatEmbeddings;
  }

  /// Represents the configuration options for the OpenAI API.
  ///
  /// [version] specifies the version of the OpenAI API to use.
  /// [messages] is an optional list of messages to include in the conversation.
  /// [prompt] is the prompt to generate a completion for.
  /// [maxTokens] specifies the maximum number of tokens in the generated output.
  /// [temperature] controls the randomness of the generated output.
  /// [topP] is the cumulative probability for selecting the next token.
  /// [n] specifies the number of completions to generate.
  /// [frequencyPenalty] penalizes words that appear too frequently.
  /// [logitBias] is a map of logit bias values for specific tokens.
  /// [logprobs] indicates whether to include log probabilities in the response.
  /// [topLogprobs] specifies the number of log probabilities to include in the response.
  /// [presencePenalty] penalizes words that are missing from the input.
  /// [responseFormat] specifies the format of the response.
  /// [seed] is an optional seed value for random number generation.
  /// [stop] specifies when to stop generating tokens.
  /// [stream] indicates whether to stream the response.
  /// [speed] controls the speed of the API response.

  Future<OpenAIChatMessage> chat({
    String version = 'new',
    List<Message>? messages,
    String? prompt,
    int? maxTokens,
    double temperature = 0.3,
    double topP = 1.0,
    int n = 1,
    double frequencyPenalty = 0,
    Map<int, double>? logitBias,
    bool? logprobs,
    int? topLogprobs,
    double? presencePenalty,
    String? responseFormat,
    int? seed,
    dynamic stop,
    bool? stream,
    double? speed,
  }) async {
    /// This code block checks the version parameter and performs necessary validations based on the version value.
    /// If the version is 'new', it checks if the 'messages' parameter is provided and not empty. It throws an ArgumentError if 'messages' is null or empty.
    /// It also throws an ArgumentError if the 'prompt' parameter is provided and not empty, as it is not allowed for the 'new' version.
    /// If the version is 'old', it sets the apiUrl to the appropriate value and checks if the 'prompt' parameter is provided and not empty. It throws an ArgumentError if 'prompt' is null or empty.
    /// If the version is neither 'new' nor 'old', it throws an ArgumentError with an error message indicating an invalid 'version' parameter.
    if (version == 'new') {
      // "new" sürümü için kontrol ekleniyor
      if (messages == null || messages.isEmpty) {
        throw ArgumentError(
            "ERROR: 'messages' parameter is required for version 'new'.");
      }
      if (prompt != null && prompt.isNotEmpty) {
        throw ArgumentError(
            "ERROR: 'prompt' parameter is not allowed for version 'new'.");
      }
    } else if (version == 'old') {
      apiUrl = "https://api.openai.com/v1/completions";

      // "old" sürümü için kontrol ekleniyor
      if (prompt == null || prompt.isEmpty) {
        throw ArgumentError(
            "ERROR: 'prompt' parameter is required for version 'old'.");
      }
    } else {
      throw ArgumentError(
          "ERROR: Invalid 'version' parameter. Accepted values are 'old' or 'old'.");
    }

    /// Validates if the given [model] is supported by the chat application.
    /// Throws an [ArgumentError] if the model is not supported.
    ///
    /// [modelValues] is a list of supported model values.
    ///
    /// Example usage:
    /// ```dart
    /// List<String> modelValues = [
    ///   "gpt-4-0125-preview",
    ///   "gpt-4-turbo-preview",
    ///   // ...
    ///   "ft:gpt-3.5-turbo:my-org:custom_suffix:id"
    /// ];
    ///
    /// String model = "gpt-4-0125-preview";
    ///
    /// if (!modelValues.contains(model)) {
    ///   throw ArgumentError('Chat application does not accept model $model');
    /// }
    /// ```
    List<String> modelValues = [
      "gpt-4-0125-preview",
      "gpt-4-turbo-preview",
      "gpt-4-1106-preview",
      "gpt-4-vision-preview",
      "gpt-4",
      "gpt-4-0314",
      "gpt-4-0613",
      "gpt-4-32k",
      "gpt-4-32k-0314",
      "gpt-4-32k-0613",
      "gpt-3.5-turbo",
      "gpt-3.5-turbo-16k",
      "gpt-3.5-turbo-0301",
      "gpt-3.5-turbo-0613",
      "gpt-3.5-turbo-1106",
      "gpt-3.5-turbo-16k-0613",
      "ft:gpt-3.5-turbo:my-org:custom_suffix:id"
    ];

    if (!modelValues.contains(model)) {
      throw ArgumentError('Chat application does not accept model $model');
    }

    /// Creates the request body with the specified parameters.
    ///
    /// The [model] parameter specifies the model to use.
    /// The [messages] parameter is optional and is used when the version is 'new'.
    /// The [prompt] parameter is optional and is used when the version is 'old'.
    /// The [maxTokens] parameter specifies the maximum number of tokens to generate.
    /// The [temperature] parameter controls the randomness of the output.
    /// The [topP] parameter controls the diversity of the output.
    /// The [n] parameter specifies the number of completions to generate.
    /// The [frequencyPenalty] parameter controls the penalty for repeating tokens.
    /// The [logitBias] parameter is optional and provides bias to the model's output.
    /// The [logprobs] parameter is optional and specifies whether to include log probabilities.
    /// The [topLogprobs] parameter is optional and specifies whether to include top log probabilities.
    /// The [presencePenalty] parameter is optional and controls the penalty for generating new tokens.
    /// The [responseFormat] parameter is optional and specifies the format of the response.
    /// The [seed] parameter is optional and provides a seed for random number generation.
    /// The [stop] parameter is optional and specifies a stopping condition for the generation.
    /// The [stream] parameter is optional and specifies whether to stream the output.
    /// The [speed] parameter is optional and controls the speed of the output.
    ///
    /// Returns a map representing the request body.
    Map<String, dynamic> requestBody = {
      "model": model,
      if (version == 'new') "messages": messages,
      if (version == 'old') "prompt": prompt,
      "frequency_penalty": frequencyPenalty,
      "logit_bias": logitBias,
      "logprobs": logprobs,
      "top_logprobs": topLogprobs,
      "n": n,
      "presence_penalty": presencePenalty,
      "response_format": responseFormat,
      "seed": seed,
      "stop": stop,
      "stream": stream,
      "temperature": temperature,
      "max_tokens": maxTokens,
      "top_p": topP,
    };

    /// Sends a POST request to the specified API endpoint with the given request body.
    ///
    /// The [requestBody] is encoded as JSON and sent as the request body.
    /// The [apiUrl] is the URL of the API endpoint.
    /// The [apiKey] is the authorization token used for authentication.
    ///
    /// Returns the response body as a string.

    final encodedBody = utf8.encode(jsonEncode(requestBody));

    // Creates a new HttpClient object
    var httpClient = HttpClient();

    // Sets the connection timeout in seconds (defaults to 30 seconds)
    httpClient.connectionTimeout = Duration(seconds: connectionTimeout);

    final request = await httpClient.postUrl(Uri.parse(apiUrl));
    request.headers.set('Content-Type', 'application/json; charset=utf-8');
    request.headers.set('Authorization', 'Bearer $apiKey');
    if (organization != '') {
      request.headers.set('OpenAI-Organization', organization);
    }
    request.add(encodedBody);

    final httpResponse = await request.close();
    String responseBody = await utf8.decodeStream(httpResponse);

    OpenAIChatMessage data = await OpenAIChatMessage.fetchData(responseBody);

    return data;
  }
}
