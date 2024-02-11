import '../../import/import.dart';

/// Represents a message in a conversation.
class Message {
  String role;
  String content;

  /// Constructs a new [Message] with the given [role] and [content].
  Message({required this.role, required this.content});

  /// Converts the [Message] object to a JSON representation.
  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
    };
  }
}