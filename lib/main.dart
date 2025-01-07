import 'package:flutter/material.dart';
import 'package:mis_lab2/providers/joke_provider.dart';
import 'package:mis_lab2/screens/daily_joke.dart';
import 'package:mis_lab2/screens/favorites.dart';
import 'package:mis_lab2/screens/home.dart';
import 'package:mis_lab2/screens/jokes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<JokeProvider>(
          create: (_) => JokeProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
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
        "/daily-joke": (context) => const DailyJoke(),
        "/favorites": (context) => const Favorites()
      },
    );
  }
}
