import 'mode_selection_screen.dart';
import 'package:flutter/material.dart';

class ApiKeysScreen extends StatefulWidget {
  const ApiKeysScreen({super.key});

  @override
  _ApiKeysScreenState createState() => _ApiKeysScreenState();
}

class _ApiKeysScreenState extends State<ApiKeysScreen> {
  final TextEditingController _apiKeyController = TextEditingController();
  final TextEditingController _secretKeyController = TextEditingController();

  void _saveKeys() {
    final apiKey = _apiKeyController.text.trim();
    final secretKey = _secretKeyController.text.trim();

    if (apiKey.isNotEmpty && secretKey.isNotEmpty) {
      // Burada API anahtarlarını kaydedebilir veya başka işlemler başlatabilirsin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('API anahtarları kaydedildi.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen her iki alanı da doldurun.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Anahtarları'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _apiKeyController,
              decoration: const InputDecoration(
                labelText: 'API Key',
                labelStyle: TextStyle(color: Colors.yellow),
              ),
              style: const TextStyle(color: Colors.yellow),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _secretKeyController,
              decoration: const InputDecoration(
                labelText: 'Secret Key',
                labelStyle: TextStyle(color: Colors.yellow),
              ),
              style: const TextStyle(color: Colors.yellow),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.yellow,
              ),
              onPressed: () {
  if (apiKey.isNotEmpty && secretKey.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ModeSelectionScreen(
          apiKey: apiKey,
          secretKey: secretKey,
        ),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Lütfen API bilgilerini girin")),
    );
  }
},
