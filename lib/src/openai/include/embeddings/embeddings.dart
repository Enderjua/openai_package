
import '../../import/import.dart';

/// A class that represents the formatted embeddings response.
class FormatEmbeddings {
  final String result;

  /// Constructs a [FormatEmbeddings] instance with the given [result].
  FormatEmbeddings({
    required this.result,
  });

  // JSON verisini işleyen yardımcı bir fonksiyon
  Map<String, dynamic> decodeResult() {
    return jsonDecode(result);
  }


  OpenAIEmbeddings extractData() {
    final jsonResponse = decodeResult();
    return OpenAIEmbeddings(
      id: jsonResponse['data'][0]['index'] ?? "WARNING: Invalid 'id' JSON address",
      object: jsonResponse['object'] ?? "WARNING: Invalid 'object' JSON address",
      embeddings: jsonResponse['data'][0]['embedding'] ?? "WARNING: Invalid 'embedding' JSON address",
      model: jsonResponse['model'] ?? "WARNING: Invalid 'model' JSON address",
      promptTokens: jsonResponse['usage']['prompt_tokens']  ?? "WARNING: prompt_tokens 'choices' JSON address",
      totalTokens: jsonResponse['usage']['total_tokens']  ?? "WARNING: Invalid 'total_tokens' JSON address",
    );
  }
}



 
/// Verileri içeren nesne
class OpenAIEmbeddings {
  final dynamic id;
  final dynamic object;
  final dynamic embeddings;
  final dynamic model;
  final dynamic promptTokens;
  final dynamic totalTokens;

  OpenAIEmbeddings({
    required this.id,
    required this.object,
    required this.embeddings,
    required this.model,
    required this.promptTokens,
    required this.totalTokens,
  });

  @override
  String toString() {
    return '''
    Index: $id
    Object: $object
    Embedding: $embeddings
    Model: $model
    Prompt Tokens: $promptTokens
    Total Tokens: $totalTokens
    ''';
  }

  static Future<OpenAIEmbeddings> fetchData(String result) async {
  return FormatEmbeddings(result: result).extractData();
}
}