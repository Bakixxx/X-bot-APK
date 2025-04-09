import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("X Bot"),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Mod Seçin",
              style: TextStyle(fontSize: 24, color: Colors.yellow),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Demo moduna geçiş buraya eklenecek
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
              child: const Text("Demo Mod"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Gerçek moduna geçiş buraya eklenecek
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
              child: const Text("Gerçek Mod"),
            ),
          ],
        ),
      ),
    );
  }
}
