import 'package:flutter/material.dart';
import 'package:mis_lab2/models/joke.dart';
import 'package:mis_lab2/models/type.dart';
import 'package:mis_lab2/services/api_services.dart';
import 'package:mis_lab2/widgets/jokes_main_grid.dart';
import 'package:mis_lab2/widgets/home_main_grid.dart';
import 'package:mis_lab2/widgets/jokeTypeCard.dart';
import 'package:mis_lab2/widgets/myAppBar.dart';

class Jokes extends StatefulWidget {
  const Jokes({super.key});

  @override
  State<Jokes> createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getJokes();
  }

  void getJokes() async {
    JokeType type = ModalRoute.of(context)!.settings.arguments as JokeType;
    List<Joke> ten_jokes = await ApiService.fetchJokes(type.jokeType);
    setState(() {
      jokes = ten_jokes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: JokeMainGrid(jokes: jokes),
    );
  }
}
