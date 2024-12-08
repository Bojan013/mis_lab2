import 'package:flutter/material.dart';
import 'package:mis_lab2/screens/home.dart';

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
        // "/details": (context) => const Details(),
      },
    );
  }
}
