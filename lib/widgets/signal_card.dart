import 'package:flutter/material.dart';

class SignalCard extends StatelessWidget {
  final String pair;
  final String signal;

  const SignalCard({super.key, required this.pair, required this.signal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(pair, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(signal, style: const TextStyle(fontSize: 18, color: Colors.blueAccent)),
          ],
        ),
      ),
    );
  }
}
