import 'package:flutter/material.dart';
import 'package:mis_lab2/screens/daily_joke.dart';
import 'package:mis_lab2/screens/home.dart';
import 'package:mis_lab2/screens/jokes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211157',
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/jokes": (context) => const Jokes(),
        // "/general": (context) => const Details(),
        // "/knock-knock": (context) => const Details(),
        // "/programming": (context) => const Details(),
        // "/dad": (context) => const Details(),
        // "/daily-joke": (context) => const DailyJoke(),
      },
    );
  }
}
