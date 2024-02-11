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