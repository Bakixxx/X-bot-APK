import 'package:flutter/material.dart';
import 'api_keys_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Bot',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.amber),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Colors.amber),
        ),
      ),
      home: ApiKeysScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
