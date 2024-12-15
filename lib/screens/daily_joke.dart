import 'package:flutter/material.dart';
import 'package:mis_lab2/models/joke.dart';
import 'package:mis_lab2/services/api_services.dart';
import 'package:mis_lab2/widgets/myAppBar.dart';

class DailyJoke extends StatefulWidget {
  const DailyJoke({super.key});

  @override
  State<DailyJoke> createState() => _JokeState();
}

class _JokeState extends State<DailyJoke> {
  Joke? joke;
  bool _showPunchline = false;

  void _togglePunchline() {
    setState(() {
      _showPunchline = !_showPunchline;
    });
  }

  @override
  void initState() {
    super.initState();
    getJokes();
  }

  void getJokes() async {
    Joke dailyJoke = await ApiService.fetchDailyJoke();
    setState(() {
      joke = dailyJoke;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: joke == null
          ? const Center(child: CircularProgressIndicator())
          : GestureDetector(
              onTap: _togglePunchline,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 6.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          joke!.setup,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
                        AnimatedOpacity(
                          opacity: _showPunchline ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            joke!.punchline,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.deepPurple,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (!_showPunchline)
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.touch_app,
                              color: Colors.deepPurple,
                              size: 20.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
