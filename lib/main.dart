import 'package:flutter/material.dart';
import 'services/binance_service.dart';

void main() {
  runApp(XBotApp());
}

class XBotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Bot',
      theme: ThemeData(
        primaryColor: Colors.yellow[700],
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(
          color: Colors.yellow[700],
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: SignalScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignalScreen extends StatefulWidget {
  @override
  _SignalScreenState createState() => _SignalScreenState();
}

class _SignalScreenState extends State<SignalScreen> {
  String signal = 'Yükleniyor...';

  void fetchSignal() async {
    final newSignal = await BinanceService.getSignal();
    setState(() {
      signal = newSignal;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchSignal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('X Bot'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            signal,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
