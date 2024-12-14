import 'package:flutter/material.dart';
import 'package:mis_lab2/models/type.dart';
import 'package:mis_lab2/services/api_services.dart';
import 'package:mis_lab2/widgets/home_main_grid.dart';
import 'package:mis_lab2/widgets/jokeTypeCard.dart';
import 'package:mis_lab2/widgets/myAppBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<JokeType> jokeTypes = [];


  @override
  void initState() {
    super.initState();
    getJokeTypes();
  }

  void getJokeTypes() async {
    List<JokeType> fetchTypes = await ApiService.fetchTypes();
    setState(() {
      jokeTypes = fetchTypes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: HomeMainGrid(types: jokeTypes),
    );
  }
}
