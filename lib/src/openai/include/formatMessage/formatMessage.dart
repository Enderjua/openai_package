import '../../import/import.dart';


/// A class that represents a formatted message.
class FormatMessage {
  final String result;

  FormatMessage({
    required this.result,
  });

  /// Returns the 'id' value from the JSON response.
  /// If the 'id' value is not found, it returns a warning message.
  String getId() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['id'] ?? "WARNING: Invalid 'id' JSON address";
  }

  /// Returns the 'object' value from the JSON response.
  /// If the 'object' value is not found, it returns a warning message.
  String getObject() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['object'] ?? "WARNING: Invalid 'object' JSON address";
  }

  /// Returns the 'created' value from the JSON response.
  /// If the 'created' value is not found, it returns a warning message.
  int getCreated() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['created'] ?? "WARNING: Invalid 'created' JSON address";
  }

  /// Returns the 'model' value from the JSON response.
  /// If the 'model' value is not found, it returns a warning message.
  String getModel() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['model'] ?? "WARNING: Invalid 'model' JSON address";
  }

  /// Returns the 'choices' value from the JSON response.
  /// If the 'choices' value is not found, it returns a warning message.
  List<dynamic> getChoices(String result) {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['choices'] ?? "WARNING: Invalid 'choices' JSON address";
  }

  /// Returns the 'content' value of the first choice's 'message' from the JSON response.
  /// If the 'message' or 'content' value is not found, it returns a warning message.
  String getMessage() {
    return getChoices(result)[0]['message']['content'] ??
        "WARNING: Invalid 'message' JSON address";
  }

  /// Returns the 'usage' value from the JSON response.
  /// If the 'usage' value is not found, it returns a warning message.
  Map<String, dynamic> getUsage() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['usage'] ?? "WARNING: Invalid 'usage' JSON address";
  }

  /// Returns the 'system_fingerprint' value from the JSON response.
  /// If the 'system_fingerprint' value is not found, it returns a warning message.
  dynamic getSystemFingerprint() {
    final jsonResponse = jsonDecode(result);
    return jsonResponse['system_fingerprint'] ??
        "WARNING: Invalid 'system_fingerprint' JSON address";
  }
}