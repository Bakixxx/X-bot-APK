import 'package:flutter/material.dart';

class SignalScreen extends StatelessWidget {
  final String mode; // "Demo" veya "Gerçek"

  const SignalScreen({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        title: Text("$mode Modu - Sinyaller"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.analytics, size: 80, color: Colors.yellow),
            const SizedBox(height: 20),
            Text(
              "$mode Modunda Bot Aktif",
              style: const TextStyle(fontSize: 22, color: Colors.yellow),
            ),
            const SizedBox(height: 20),
            const Text(
              "Sinyaller burada gösterilecek...",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
