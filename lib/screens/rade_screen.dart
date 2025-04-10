import 'package:flutter/material.dart';
import '../services/trade_executor.dart';
import 'api_keys_screen.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  final _symbolController = TextEditingController(text: 'BTCUSDT');
  final _quantityController = TextEditingController(text: '0.001');
  String _side = 'BUY';
  String _type = 'MARKET';
  String _message = '';

  void _executeTrade() async {
    final apiKey = ApiKeyStorage.apiKey;
    final secretKey = ApiKeyStorage.secretKey;

    if (apiKey == null || secretKey == null) {
      setState(() => _message = 'API anahtarları bulunamadı.');
      return;
    }

    final executor = TradeExecutor(apiKey: apiKey, secretKey: secretKey);
    try {
      await executor.placeOrder(
        symbol: _symbolController.text,
        side: _side,
        type: _type,
        quantity: _quantityController.text,
      );
      setState(() => _message = 'İşlem gönderildi.');
    } catch (e) {
      setState(() => _message = 'Hata: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('İşlem Ekranı')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _symbolController,
              decoration: const InputDecoration(labelText: 'Sembol (örnek: BTCUSDT)'),
            ),
            TextField(
              controller: _quantityController,
              decoration: const InputDecoration(labelText: 'Miktar'),
            ),
            DropdownButton<String>(
              value: _side,
              items: const [
                DropdownMenuItem(value: 'BUY', child: Text('Al (BUY)')),
                DropdownMenuItem(value: 'SELL', child: Text('Sat (SELL)')),
              ],
              onChanged: (value) => setState(() => _side = value!),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _executeTrade,
              child: const Text('İşlemi Gönder'),
            ),
            const SizedBox(height: 20),
            Text(_message, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
