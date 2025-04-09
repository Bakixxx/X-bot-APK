import 'package:flutter/material.dart';
import 'api_key_storage.dart';
import 'main.dart';

class ApiKeyInputPage extends StatefulWidget {
  const ApiKeyInputPage({super.key});

  @override
  State<ApiKeyInputPage> createState() => _ApiKeyInputPageState();
}

class _ApiKeyInputPageState extends State<ApiKeyInputPage> {
  final _apiKeyController = TextEditingController();
  final _secretKeyController = TextEditingController();

  void _saveAndProceed() async {
    await ApiKeyStorage.saveKeys(
      _apiKeyController.text,
      _secretKeyController.text,
    );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ModeSelectionPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Anahtarı Girişi")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _apiKeyController,
              decoration: const InputDecoration(labelText: 'API Key'),
            ),
            TextField(
              controller: _secretKeyController,
              decoration: const InputDecoration(labelText: 'Secret Key'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveAndProceed,
              child: const Text("Kaydet ve Devam Et"),
            ),
          ],
        ),
      ),
    );
  }
}
