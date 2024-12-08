import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab2/models/joke.dart';
import 'package:mis_lab2/widgets/api_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
    getJokes();
  }

  void getJokes() async {
    var fetchJokes = await ApiService.fetchJokes();
    setState(() {
      jokes = fetchJokes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("asdads $jokes");
  }
}
