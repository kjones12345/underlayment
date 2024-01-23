// lib/main.dart
import 'package:flutter/material.dart';
import 'package:underlayment/main_app.dart';
import 'package:underlayment/persistence/database_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseManager().init();
  runApp(MainApp());
}
