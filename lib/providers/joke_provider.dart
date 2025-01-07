import 'package:flutter/cupertino.dart';
import 'package:mis_lab2/models/joke.dart';
import 'package:mis_lab2/services/api_services.dart';

class JokeProvider extends ChangeNotifier {
  List<Joke> generalJokes = [];
  List<Joke> knockKnockJokes = [];
  List<Joke> programmingJokes = [];
  List<Joke> dadJokes = [];

  JokeProvider() {
    _loadJokes();
  }

  Future<void> _loadJokes() async {
    generalJokes = await ApiService.fetchJokes("general");
    knockKnockJokes = await ApiService.fetchJokes("knock-knock");
    programmingJokes = await ApiService.fetchJokes("programming");
    dadJokes = await ApiService.fetchJokes("dad");
    notifyListeners();
  }

  void toggleFavorite(Joke joke) {
    joke.isFavorite = !joke.isFavorite;
    notifyListeners();
  }
}
