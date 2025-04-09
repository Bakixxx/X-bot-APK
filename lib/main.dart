import 'package:flutter/material.dart';
import 'api_key_input.dart';
import 'api_key_storage.dart';
import 'mode_controller.dart';

void main() {
  runApp(const MyApp());
}


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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _getStartPage() async {
    final keys = await ApiKeyStorage.loadKeys();
    if (keys['apiKey'] == null || keys['secretKey'] == null) {
      return const ApiKeyInputPage();
    } else {
      return const ModeSelectionPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Bot',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _getStartPage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data!;
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
