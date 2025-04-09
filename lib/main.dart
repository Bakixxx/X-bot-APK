import 'package:flutter/material.dart';
import 'screens/api_keys_screen.dart'; // <-- Bunu ekliyoruz

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Bot',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.yellow),
          bodyMedium: TextStyle(color: Colors.yellow),
        ),
      ),
      home: HomeScreen(), // <-- Burası varsa burayı düzenleyeceğiz
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('X Bot'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.yellow,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ApiKeysScreen()),
            );
          },
          child: const Text("API Anahtarlarını Gir"),
        ),
      ),
    );
  }
}
