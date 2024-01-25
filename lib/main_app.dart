// lib/main_app.dart
import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'underlayment/family_layer/theme_provider.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Underlayment',
      theme: themeProvider.themeData, // Use the theme from the provider
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blueGrey,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Underlayment App'),
          actions: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Use the context within the Builder for Navigator.push
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: const Center(
          child: Text('Underlayment Main Page'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
