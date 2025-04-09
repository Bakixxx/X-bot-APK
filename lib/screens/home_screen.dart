import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("X Bot - Ana Sayfa"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
      ),
      body: const Center(
        child: Text(
          "Bot başarıyla başlatıldı!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
