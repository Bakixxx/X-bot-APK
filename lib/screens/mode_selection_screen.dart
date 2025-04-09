import 'package:flutter/material.dart';
import 'signal_screen.dart';

class ModeSelectionScreen extends StatelessWidget {
  final String apiKey;
  final String secretKey;

  ModeSelectionScreen({required this.apiKey, required this.secretKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mod Seçimi')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignalScreen(
                      apiKey: apiKey,
                      secretKey: secretKey,
                      isDemo: true,
                    ),
                  ),
                );
              },
              child: Text('Demo Mod'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignalScreen(
                      apiKey: apiKey,
                      secretKey: secretKey,
                      isDemo: false,
                    ),
                  ),
                );
              },
              child: Text('Gerçek Mod'),
            ),
          ],
        ),
      ),
    );
  }
}
