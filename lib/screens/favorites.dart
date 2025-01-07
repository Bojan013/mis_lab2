import 'package:flutter/material.dart';
import 'package:mis_lab2/providers/joke_provider.dart';
import 'package:mis_lab2/widgets/joke_card.dart';
import 'package:mis_lab2/widgets/jokes_main_grid.dart';
import 'package:mis_lab2/widgets/myAppBar.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final allJokes = [
      ...context.watch<JokeProvider>().generalJokes,
      ...context.watch<JokeProvider>().knockKnockJokes,
      ...context.watch<JokeProvider>().programmingJokes,
      ...context.watch<JokeProvider>().dadJokes,
    ];

    final favoriteJokes = allJokes.where((j) => j.isFavorite).toList();

    return Scaffold(
      appBar: myAppBar(context),
      body: favoriteJokes.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.heart_broken, size: 50),
            SizedBox(height: 10),
            Text("You've no favorites yet."),
          ],
        ),
      )
          : JokeMainGrid(jokes: favoriteJokes),
    );
  }
}