import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/trade_screen.dart';
import 'screens/api_keys_screen.dart';

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
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/trade': (context) => const TradeScreen(),
        '/apikeys': (context) => const ApiKeysScreen(),
      },
    );
  }
}
