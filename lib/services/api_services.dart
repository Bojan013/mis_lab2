import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mis_lab2/models/joke.dart';
import 'package:mis_lab2/models/type.dart';

class ApiService {
  static Future<List<JokeType>> fetchTypes() async {
    final response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/types"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((type) => JokeType.fromJson(type as String)).toList();
    } else {
      throw Exception('Failed to load types');
    }
  }

  static Future<List<Joke>> fetchJokes(String type) async {
    final response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((jokeJson) => Joke.fromJson(jokeJson)).toList();
    } else {
      throw Exception('Failed to load jokes');
    }
  }
}
