import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab2/models/joke.dart';
import 'package:mis_lab2/models/type.dart';

class JokeCard extends StatefulWidget {
  final Joke joke;

  const JokeCard({super.key, required this.joke});

  @override
  _JokeCard createState() => _JokeCard();
}

class _JokeCard extends State<JokeCard> {
  bool _showPunchline = false;

  void _togglePunchline() {
    setState(() {
      _showPunchline = !_showPunchline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePunchline,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 6.0,
        color: Colors.white,
        shadowColor: Colors.black26,
        margin: const EdgeInsets.all(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.joke.setup,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16.0),
              AnimatedOpacity(
                opacity: _showPunchline ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Text(
                  widget.joke.punchline,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              if (!_showPunchline)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(
                      Icons.touch_app,
                      color: Colors.deepPurple,
                      size: 20.0,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
