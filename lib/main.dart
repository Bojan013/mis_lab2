import 'package:flutter/material.dart';
import 'package:mis_lab2/providers/joke_provider.dart';
import 'package:mis_lab2/screens/daily_joke.dart';
import 'package:mis_lab2/screens/favorites.dart';
import 'package:mis_lab2/screens/home.dart';
import 'package:mis_lab2/screens/jokes.dart';
import 'package:mis_lab2/services/notifications_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  NotificationsService().initialize();

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
