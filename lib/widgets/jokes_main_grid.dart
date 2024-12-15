import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab2/models/joke.dart';
import 'package:mis_lab2/models/type.dart';
import 'package:mis_lab2/widgets/joke_card.dart';
import 'package:mis_lab2/widgets/joke_type_card.dart';

class JokeMainGrid extends StatefulWidget {
  final List<Joke> jokes;

  const JokeMainGrid({super.key, required this.jokes});

  @override
  _JokeMainGrid createState() => _JokeMainGrid();
}

class _JokeMainGrid extends State<JokeMainGrid> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.jokes.length,
      itemBuilder: (context, index) {
        final item = widget.jokes[index];
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: JokeCard(joke: item),
          ),
        );
      },
    );
  }
}