import 'package:flutter/material.dart';
import '../bot/binance_bot.dart';

class SignalScreen extends StatefulWidget {
  final String apiKey;
  final String secretKey;

  const SignalScreen({
    Key? key,
    required this.apiKey,
    required this.secretKey,
  }) : super(key: key);

  @override
  _SignalScreenState createState() => _SignalScreenState();
}

class _SignalScreenState extends State<SignalScreen> {
  String signalMessage = 'Sinyal bekleniyor...';

  @override
  void initState() {
    super.initState();
    getSignal();
  }

  Future<void> getSignal() async {
    final bot = BinanceBot(apiKey: widget.apiKey, secretKey: widget.secretKey);
    await bot.generateSignal("BTCUSDT"); // Şimdilik BTC/USDT örneği

    setState(() {
      signalMessage = 'Sinyal başarıyla üretildi!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sinyal Ekranı")),
      body: Center(child: Text(signalMessage)),
    );
  }
}
