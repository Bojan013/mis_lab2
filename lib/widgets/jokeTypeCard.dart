import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab2/models/type.dart';

class JokeTypeCard extends StatefulWidget {
  final JokeType jokeType;

  const JokeTypeCard({super.key, required this.jokeType});

  @override
  _JokeTypeCard createState() => _JokeTypeCard();
}

class _JokeTypeCard extends State<JokeTypeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.jokeType.jokeType,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
