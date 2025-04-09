import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiKeysScreen extends StatefulWidget {
  @override
  _ApiKeysScreenState createState() => _ApiKeysScreenState();
}

class _ApiKeysScreenState extends State<ApiKeysScreen> {
  final _storage = FlutterSecureStorage();
  final _apiKeyController = TextEditingController();
  final _secretKeyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadKeys();
  }

  Future<void> _loadKeys() async {
    _apiKeyController.text = await _storage.read(key: 'apiKey') ?? '';
    _secretKeyController.text = await _storage.read(key: 'secretKey') ?? '';
  }

  Future<void> _saveKeys() async {
    await _storage.write(key: 'apiKey', value: _apiKeyController.text);
    await _storage.write(key: 'secretKey', value: _secretKeyController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('API anahtarları kaydedildi')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Anahtarları')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _apiKeyController,
              decoration: InputDecoration(labelText: 'API Key'),
            ),
            TextField(
              controller: _secretKeyController,
              decoration: InputDecoration(labelText: 'Secret Key'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveKeys,
              child: Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
