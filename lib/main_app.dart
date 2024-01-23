// lib/main_app.dart
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Underlayment',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blueGrey,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Underlayment App'),
        ),
        body: Center(
          child: Text('Underlayment Main Page'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
