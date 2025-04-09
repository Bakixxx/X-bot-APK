import 'package:flutter/material.dart';
import 'binance_api.dart';
import 'mode_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Bot',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: const ModeSelectionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ModeSelectionPage extends StatelessWidget {
  const ModeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("X Bot Mod Seçimi")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ModeController.setMode(AppMode.demo);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const MyHomePage()));
              },
              child: const Text("Demo Modu"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ModeController.setMode(AppMode.real);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const MyHomePage()));
              },
              child: const Text("Gerçek Mod"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void placeOrder(String side) {
    if (ModeController.isDemo) {
      print("DEMO: $side emri simüle edildi");
    } else {
      BinanceApi api = BinanceApi();
      api.placeOrder(
        symbol: 'BTCUSDT',
        side: side,
        type: 'MARKET',
        quantity: '0.001',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mode = ModeController.isDemo ? "DEMO MODU" : "GERÇEK MOD";

    return Scaffold(
      appBar: AppBar(
        title: Text("X Bot - $mode"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => placeOrder("BUY"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("BTC AL", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => placeOrder("SELL"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("BTC SAT", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
