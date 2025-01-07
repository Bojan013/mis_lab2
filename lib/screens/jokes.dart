import 'package:flutter/material.dart';
import 'package:mis_lab2/models/joke.dart';
import 'package:mis_lab2/models/type.dart';
import 'package:mis_lab2/providers/joke_provider.dart';
import 'package:mis_lab2/services/api_services.dart';
import 'package:mis_lab2/widgets/jokes_main_grid.dart';
import 'package:mis_lab2/widgets/home_main_grid.dart';
import 'package:mis_lab2/widgets/joke_type_card.dart';
import 'package:mis_lab2/widgets/myAppBar.dart';
import 'package:provider/provider.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getJokes();
    });
  }

  void getJokes() {
    final jokeProvider = Provider.of<JokeProvider>(context, listen: false);
    final JokeType type = ModalRoute.of(context)!.settings.arguments as JokeType;

    List<Joke> tenJokes = [];
    if (type.jokeType == "general") {
      tenJokes = jokeProvider.generalJokes;
    } else if (type.jokeType == "knock-knock") {
      tenJokes = jokeProvider.knockKnockJokes;
    } else if (type.jokeType == "programming") {
      tenJokes = jokeProvider.programmingJokes;
    } else if (type.jokeType == "dad") {
      tenJokes = jokeProvider.dadJokes;
    }

    setState(() {
      jokes = tenJokes;
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
