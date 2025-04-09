import 'package:flutter/material.dart';

class ApiKeysScreen extends StatefulWidget {
  const ApiKeysScreen({super.key});

  @override
  _ApiKeysScreenState createState() => _ApiKeysScreenState();
}

class _ApiKeysScreenState extends State<ApiKeysScreen> {
  final TextEditingController _apiKeyController = TextEditingController();
  final TextEditingController _secretKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: const Text("Binance API Anahtarları"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _apiKeyController,
              decoration: const InputDecoration(
                labelText: 'API Key',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _secretKeyController,
              decoration: const InputDecoration(
                labelText: 'Secret Key',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
  onPressed: () {
  if (apiKey.isNotEmpty && secretKey.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignalScreen(
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
