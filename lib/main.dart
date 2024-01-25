// lib/main.dart
import 'package:flutter/material.dart';
import 'package:underlayment/main_app.dart';
import 'package:underlayment/underlayment/concrete_layer/persistence/database_manager.dart';
import 'package:underlayment/underlayment/family_layer/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseManager().init();

  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          ThemeProvider(ThemeData.dark()), // Set your default theme here
      child: const MainApp(),
    ),
  );
}
