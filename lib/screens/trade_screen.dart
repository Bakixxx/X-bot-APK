import 'package:flutter/material.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  bool isDemoMode = true;

  void _toggleMode() {
    setState(() {
      isDemoMode = !isDemoMode;
    });
  }

  void _startTrade() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isDemoMode ? 'Demo işlem başlatıldı' : 'Gerçek işlem başlatıldı'),
      ),
    );
    // Buraya işlem başlatma kodları entegre edilecek
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('İşlem Modu')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isDemoMode ? 'DEMO MODU' : 'GERÇEK MOD',
              style: TextStyle(
                fontSize: 24,
                color: isDemoMode ? Colors.amber : Colors.redAccent,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleMode,
              child: Text('Modu Değiştir'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startTrade,
              child: Text('İşlem Başlat'),
            ),
          ],
        ),
      ),
    );
  }
}
