import '../../import/import.dart';

/// A class that represents the formatted embeddings response.
class FormatEmbeddings {
  final String result;

  /// Constructs a [FormatEmbeddings] instance with the given [result].
  FormatEmbeddings({
    required this.result,
  });

  /// Returns the index value from the JSON response.
  ///
  /// If the 'index' JSON address is invalid, a warning message is returned.
  int getIndex() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['data'][0]['index'] ??
        "WARNING: Invalid 'index' JSON address";
  }

  /// Returns the object value from the JSON response.
  ///
  /// If the 'object' JSON address is invalid, a warning message is returned.
  String getObject() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['object'] ?? "WARNING: Invalid 'object' JSON address";
  }

  /// Returns the embedding value from the JSON response.
  ///
  /// If the 'embedding' JSON address is invalid, a warning message is returned.
  List<dynamic> getEmbedding() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['data'][0]['embedding'] ??
        "WARNING: Invalid 'embedding' JSON address";
  }

  /// Returns the model value from the JSON response.
  ///
  /// If the 'model' JSON address is invalid, a warning message is returned.
  String getModel() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['model'] ?? "WARNING: Invalid 'model' JSON address";
  }

  /// Returns the number of prompt tokens from the JSON response.
  ///
  /// If the 'prompt_tokens' JSON address is invalid, a warning message is returned.
  int getPromptTokens() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['usage']['prompt_tokens'] ??
        "WARNING: Invalid 'prompt_tokens' JSON address";
  }

  /// Returns the total number of tokens from the JSON response.
  ///
  /// If the 'total_tokens' JSON address is invalid, a warning message is returned.
  int getTotalTokens() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['usage']['total_tokens'] ??
        "WARNING: Invalid 'total_tokens' JSON address";
  }
}