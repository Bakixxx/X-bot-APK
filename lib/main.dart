import 'package:flutter/material.dart';
import 'package:x_bot/pages/home_page.dart';

void main() {
  runApp(const XBotApp());
}

class XBotApp extends StatelessWidget {
  const XBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Bot',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}
