import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mis_lab2/models/joke.dart';

class ApiService {
  static Future<List<Joke>> fetchJokes() async {
    final response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/jokes/ten"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((jokeJson) => Joke.fromJson(jokeJson)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
