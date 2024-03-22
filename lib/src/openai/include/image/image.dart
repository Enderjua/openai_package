import '../../import/import.dart';


/// A class that represents a formatted image.
class FormatImage {
  final String result;

  /// Constructs a [FormatImage] object with the given [result].
  FormatImage({
    required this.result,
  });

  /// Returns the URL of the image based on the specified [model].
  ///
  /// If the [model] is 'dall-e-3' or 'dall-e-2', it parses the [result] JSON
  /// and retrieves the URL from the data. If the URL is not found, it returns
  /// a warning message.
  ///
  /// Throws an [ArgumentError] if the [model] is unsupported.
  /// 
  Map<String, dynamic> decodeResult() {
    return jsonDecode(result);
  }

  OpenAIGenerateImage extractData() {
    final response = decodeResult();
    return OpenAIGenerateImage(created: response['created'] ??  "WARNING: Invalid 'created' JSON address", revised_prompt: response['data'][0]['revised_prompt'] ??  "WARNING: Invalid 'prompt' JSON address", url: response['data'][0]['url'] ??  "WARNING: Invalid 'url' JSON address",);
  }
  String getImageUrl({String? model}) {
    if (model == 'dall-e-3' || model == 'dall-e-2') {
      final jsonResponse = jsonDecode(result);
      return jsonResponse['data'][0]['url'] ??
          "WARNING: Invalid 'url' JSON address";
    } else {
      throw ArgumentError('Unsupported model: $model');
    }
  }

  /// Returns the prompt of the image based on the specified [model].
  ///
  /// If the [model] is 'dall-e-3', it parses the [result] JSON and retrieves
  /// the revised prompt from the data. If the revised prompt is not found,
  /// it returns a warning message.
  ///
  /// Throws an [ArgumentError] if the [model] is unsupported.
  String getPrompt({String? model}) {
    if (model == 'dall-e-3') {
      final jsonResponse = jsonDecode(result);
      return jsonResponse['data'][0]['revised_prompt'] ??
          "WARNING: Invalid 'revised_prompt' JSON address";
    } else {
      throw ArgumentError('Unsupported model: $model');
    }
  }
}


class OpenAIGenerateImage {
  final dynamic created;
  final dynamic revised_prompt;
  final dynamic url;

  OpenAIGenerateImage({
    required this.created,
    required this.revised_prompt,
    required this.url,
  });

  @override
  String toString() {
    return """ 
    Created: $created,
    Revised_prompt: $revised_prompt,
    URL: $url
    """;
  }

  static Future<OpenAIGenerateImage> fetchData(String result) async {
    return FormatImage(result: result).extractData();
  }


}