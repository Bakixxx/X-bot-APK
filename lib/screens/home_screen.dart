import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDemoMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('X Bot'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        actions: [
          Switch(
            value: isDemoMode,
            activeColor: Colors.yellow,
            onChanged: (value) {
              setState(() {
                isDemoMode = value;
              });
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.trending_up,
              size: 80,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            Text(
              isDemoMode ? 'Demo Modu Aktif' : 'Gerçek Mod Aktif',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              'Bot alım-satım işlemleri yapıyor...',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
