import 'package:flutter/material.dart';
import 'package:x_bot/services/binance_service.dart';

class TradePage extends StatefulWidget {
  final String mode;
  const TradePage({super.key, required this.mode});

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  String status = 'Sinyal bekleniyor...';

  @override
  void initState() {
    super.initState();
    getSignal();
  }

  Future<void> getSignal() async {
    setState(() {
      status = 'Sinyal aranıyor...';
    });

    final signal = await BinanceService.getSignal();

    setState(() {
      status = signal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.mode} Mod'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Alım-Satım Botu Durumu:',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              status,
              style: const TextStyle(fontSize: 16, color: Colors.amber),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: getSignal,
              child: const Text('Yeniden Kontrol Et'),
            ),
          ],
        ),
      ),
    );
  }
}
