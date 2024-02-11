import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:openai_package/openai_package.dart';

void main() {
  group('OpenAI', () async {
    late OpenAI openAI;

    setUp(() {
        openAI = OpenAI(apiKey: 'your_api_key', model: 'your_model');
      });

      test('speech should throw an ArgumentError if the model is not supported', () {
        expect(() => openAI.speech(
          input: 'Hello',
         //  model: 'invalid_model',
          voice: 'alloy',
          response_format: 'mp3',
          output: 'speech.mp3',
          speed: 1.0,
        ), throwsArgumentError);
      });

      test('speech should throw an ArgumentError if the voice is not supported', () {
        expect(() => openAI.speech(
          input: 'Hello',
          // model: 'tts-1',
          voice: 'invalid_voice',
          response_format: 'mp3',
          output: 'speech.mp3',
          speed: 1.0,
        ), throwsArgumentError);
      });

      test('speech should throw an ArgumentError if the response format is not valid', () {
        expect(() => openAI.speech(
          input: 'Hello',
          // model: 'tts-1',
          voice: 'alloy',
          response_format: 'invalid_format',
          output: 'speech.mp3',
          speed: 1.0,
        ), throwsArgumentError);
      });

      test('speech should throw an Exception if the server returns an unexpected response', () async {
        // Mock the http.post method to return a response with status code other than 200

        expect(() => openAI.speech(
          input: 'Hello',
          // model: 'tts-1',
          voice: 'alloy',
          response_format: 'mp3',
          output: 'speech.mp3',
          speed: 1.0,
        ), throwsException);
      });

      test('speech should download the file if the server returns a 200 OK response', () async {
        // Mock the http.post method to return a response with status code 200
        httpPost(void Function(Uri url, {Map<String, String>? headers, Object? body}) callback) {
          // Implement the setter logic here
        }
          return http.Response('file content', 200);
        });

        // Mock the File.writeAsBytes method to do nothing
        openAI.fileWriteAsBytes = (String path, List<int> bytes, {FileMode mode = FileMode.write, bool flush = false}) async {};

        final result = await openAI.speech(
        input: 'Hello',
        // model: 'tts-1',
        voice: 'alloy',
        response_format: 'mp3',
        output: 'speech.mp3',
        speed: 1.0,
      );

      expect(result, 'File downloaded to speech.mp3');
    });
  }
