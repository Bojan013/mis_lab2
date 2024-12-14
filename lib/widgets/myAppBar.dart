import 'package:flutter/material.dart';

AppBar myAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.home,
        size: 30,
      ),
      color: Colors.white,
      onPressed: () {
        Navigator.pushNamed(context, '/');
      },
      tooltip: 'Go to Home',
    ),
    title: const Text(
      '211157',
      style: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.black87,
    centerTitle: true,
    actions: [
      IconButton(
        icon: const Icon(Icons.emoji_emotions, size: 30),
        color: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, '/daily-joke');
        },
        tooltip: 'Smile',
      ),
    ],
  );
}
