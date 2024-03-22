// ignore_for_file: file_names

import '../../import/import.dart';


/// A class that represents a formatted message.
class FormatMessage {
  final String result;

  FormatMessage({
    required this.result,
  });

  // JSON verisini işleyen yardımcı bir fonksiyon
  Map<String, dynamic> decodeResult() {
    return jsonDecode(result);
  }

  // Elde edilen verileri içeren nesneyi döndüren fonksiyon
  OpenAIChatMessage extractData() {
    final jsonResponse = decodeResult();
    return OpenAIChatMessage(
      id: jsonResponse['id'] ?? "WARNING: Invalid 'id' JSON address",
      object: jsonResponse['object'] ?? "WARNING: Invalid 'object' JSON address",
      created: jsonResponse['created'] ?? "WARNING: Invalid 'created' JSON address",
      model: jsonResponse['model'] ?? "WARNING: Invalid 'model' JSON address",
      choices: jsonResponse['choices'] ?? "WARNING: Invalid 'choices' JSON address",
      message: jsonResponse['choices'][0]['message']['content' ] ?? "WARNING: Invalid 'message' JSON address",
      usage: jsonResponse['usage'] ?? "WARNING: Invalid 'usage' JSON address",
      systemFingerprint: jsonResponse['system_fingerprint'] ?? "WARNING: Invalid 'system_fingerprint' JSON address",
    );
  }
}

/// Verileri içeren nesne
class OpenAIChatMessage {
  final dynamic id;
  final dynamic object;
  final dynamic created;
  final dynamic model;
  final dynamic choices;
  final dynamic message;
  final dynamic usage;
  final dynamic systemFingerprint;

  OpenAIChatMessage({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.message,
    required this.usage,
    required this.systemFingerprint,
  });

  @override
  String toString() {
    return '''
    ID: $id
    Object: $object
    Created: $created
    Model: $model
    Choices: $choices
    Usage: $usage
    System Fingerprint: $systemFingerprint
    ''';
  }

  static Future<OpenAIChatMessage> fetchData(String result) async {
  return FormatMessage(result: result).extractData();
}
}

