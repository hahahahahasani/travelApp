import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travelapp/view/home1.dart';
import 'package:travelapp/view/login.dart';
import 'package:travelapp/view/navbar.dart';
import 'package:travelapp/view/onboarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBoPAvCbv-0bMkThul0YqRQQyiJ2e1igJM",
      appId: "1:993476696496:android:d9e5f100fc6d54562f9e75",
      messagingSenderId: "993476696496",
      projectId: "wisata-3f801",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navbar(),
    );
  }
}
