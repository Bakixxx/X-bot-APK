import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final bool isDemo;

  const HomeScreen({super.key, required this.isDemo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(isDemo ? 'X Bot - DEMO Mod' : 'X Bot - Gerçek Mod'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.show_chart, size: 100, color: Colors.yellow),
            const SizedBox(height: 20),
            Text(
              isDemo
                  ? 'DEMO modda işlemler simüle ediliyor.'
                  : 'Gerçek modda canlı işlemler yapılıyor.',
              style: const TextStyle(color: Colors.yellow, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Botu başlatacak fonksiyon buraya eklenecek
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
              child: const Text('BOTU BAŞLAT'),
            ),
          ],
        ),
      ),
    );
  }
}
