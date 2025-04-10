import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiKeysScreen extends StatefulWidget {
  const ApiKeysScreen({super.key});

  @override
  State<ApiKeysScreen> createState() => _ApiKeysScreenState();
}

class _ApiKeysScreenState extends State<ApiKeysScreen> {
  final TextEditingController _apiKeyController = TextEditingController();
  final TextEditingController _secretKeyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedKeys();
  }

  Future<void> _loadSavedKeys() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _apiKeyController.text = prefs.getString('apiKey') ?? '';
      _secretKeyController.text = prefs.getString('secretKey') ?? '';
    });
  }

  Future<void> _saveKeys() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('apiKey', _apiKeyController.text);
    await prefs.setString('secretKey', _secretKeyController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('API anahtarları kaydedildi')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Anahtarları')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _apiKeyController,
              decoration: const InputDecoration(labelText: 'API Key'),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _secretKeyController,
              decoration: const InputDecoration(labelText: 'Secret Key'),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveKeys,
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
