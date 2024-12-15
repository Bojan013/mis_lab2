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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 6.0,
      color: Colors.white,
      shadowColor: Colors.black26,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                widget.jokeType.jokeType,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
