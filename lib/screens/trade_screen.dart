import 'package:flutter/material.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('İşlem Ekranı')),
      body: const Center(
        child: Text(
          'İşlemler burada görünecek.',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
