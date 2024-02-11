import '../../import/import.dart';


/// A class that provides methods for formatting transcriptions.
class FormatTranscriptions {
  final Map<String, dynamic> result;

  /// Constructs a [FormatTranscriptions] object with the given [result].
  FormatTranscriptions({
    required this.result,
  });

  /// Generates a random string of the specified [length].
  ///
  /// The generated string consists of lowercase and uppercase letters
  /// as well as digits.
  String generateRandomString(int length) {
    const charset =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    Random random = Random();
    List<String> randomStrings = List.generate(
      length,
      (index) => charset[random.nextInt(charset.length)],
    );

    return randomStrings.join();
  }

  /// Writes the given [jsonData] to a JSON file and returns the file name.
  ///
  /// The JSON data is converted to a string using [jsonEncode] before writing
  /// it to the file. If the file write operation fails, an error message is returned.
  String writeJsonToFile(Map<String, dynamic> jsonData) {
    // File creation
    String fileName = generateRandomString(20);
    File file = File(fileName);

    // Convert JSON data to string
    String jsonString = jsonEncode(jsonData);

    try {
      // Write to file
      file.writeAsStringSync(jsonString);
      return 'JSON: $fileName';
    } catch (e) {
      return '$e';
    }
  }
}