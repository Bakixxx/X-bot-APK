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
      appBar: AppBar(
        title: const Text('X Bot'),
        actions: [
          IconButton(
            icon: const Icon(Icons.vpn_key),
            onPressed: () {
              Navigator.pushNamed(context, '/apikeys');
            },
          ),
          IconButton(
            icon: const Icon(Icons.trending_up),
            onPressed: () {
              Navigator.pushNamed(context, '/trade');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sinyal: $_signal', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final engine = SignalEngine();
                engine.processSignal();
              },
              child: const Text('İşlem Başlat'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getSignal,
              child: const Text('Yeni Sinyal Al'),
            ),
          ],
        ),
      ),
    );
  }
}
