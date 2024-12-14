import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab2/models/type.dart';
import 'package:mis_lab2/widgets/jokeTypeCard.dart';

class HomeMainGrid extends StatefulWidget {
  final List<JokeType> types;

  const HomeMainGrid({super.key, required this.types});

  @override
  _HomeMainGridState createState() => _HomeMainGridState();
}

class _HomeMainGridState extends State<HomeMainGrid> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.types.length,
      itemBuilder: (context, index) {
        final item = widget.types[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/jokes',
              arguments: item,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: JokeTypeCard(jokeType: item),
          ),
        );
      },
    );
  }
}