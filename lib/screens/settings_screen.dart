import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.vpn_key, color: Colors.white),
            title: Text('API Anahtarları', style: TextStyle(color: Colors.white)),
            subtitle: Text('Binance API anahtarlarını düzenle', style: TextStyle(color: Colors.white70)),
          ),
          ListTile(
            leading: Icon(Icons.color_lens, color: Colors.white),
            title: Text('Tema', style: TextStyle(color: Colors.white)),
            subtitle: Text('Uygulama temasını değiştir', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}
