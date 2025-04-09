import 'package:flutter/material.dart';
import '../services/signal_engine.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _signal = 'Sinyal bekleniyor...';

  void _getSignal() async {
    SignalEngine engine = SignalEngine();
    String signal = await engine.generateSignal('BTCUSDT');
    setState(() {
      _signal = signal;
    });
  }

  @override
  void initState() {
    super.initState();
    _getSignal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('X Bot')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sinyal: $_signal', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getSignal,
              child: const Text('Sinyali Yenile'),
            ),
          ],
        ),
      ),
    );
  }
}
