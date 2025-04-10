import 'package:flutter/material.dart';

class SignalDisplay extends StatelessWidget {
  final String signal;

  const SignalDisplay({Key? key, required this.signal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    if (signal == 'AL') {
      bgColor = Colors.green;
    } else if (signal == 'SAT') {
      bgColor = Colors.red;
    } else {
      bgColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        signal,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
