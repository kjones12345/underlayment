// lib/settings_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'underlayment/family_layer/theme_family.dart';
import 'underlayment/abstract_layer/theme_capability.dart';
import 'underlayment/family_layer/theme_provider.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Instantiate your ThemeFamily
  final ThemeFamily themeFamily = ThemeFamily();

  // Map to hold the selected theme for each platform
  Map<String, ThemeCapability?> selectedThemes = {
    'Android': null,
    'iOS': null,
    'Fuchsia': null,
    'Web': null,
    'Windows': null,
    'MacOS': null,
    'Linux': null,
  };

  @override
  void initState() {
    super.initState();
    // Initialize the selectedThemes with default themes or saved preferences
    // For this example, we're just setting them to the first theme in the family
    for (var platform in selectedThemes.keys) {
      selectedThemes[platform] =
          themeFamily.capabilities.values.first as ThemeCapability;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: const Text('Themes'),
            children: <Widget>[
              for (var platform in selectedThemes.keys) ...[
                ListTile(
                  title: Text('${platform} Theme'),
                  trailing: DropdownButton<ThemeCapability>(
                    value: selectedThemes[platform],
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (ThemeCapability? newValue) {
                      setState(() {
                        selectedThemes[platform] = newValue;
                        if (platform == getPlatformString()) {
                          // Apply the theme immediately if it's the current platform
                          final themeProvider = Provider.of<ThemeProvider>(
                              context,
                              listen: false);
                          themeProvider.applyTheme(newValue); // Apply the theme
                        }
                      });
                    },
                    items: themeFamily.capabilities.values
                        .where((capability) => capability
                            is ThemeCapability) // Ensure the capability is a ThemeCapability
                        .map<DropdownMenuItem<ThemeCapability>>((capability) {
                      final themeCapability = capability
                          as ThemeCapability; // Cast to ThemeCapability
                      return DropdownMenuItem<ThemeCapability>(
                        value: themeCapability,
                        child: Text(themeCapability.name),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ],
          ),
          ExpansionTile(
            title: const Text('Persistence'),
            children: const <Widget>[
              ListTile(
                title: Text('Persistence settings coming soon'),
              ),
            ],
          ),
          // ... [add more folds for other capabilities as needed]
        ],
      ),
    );
  }

  // A function to apply the theme
  void applyTheme(ThemeCapability? themeCapability) {
    if (themeCapability != null) {
      // You might need a way to apply this theme to your MaterialApp, such as using a ThemeBloc or Provider
    }
  }

  // A function to get the current platform as a string
  String getPlatformString() {
    // This method assumes you have imported 'dart:io' and 'package:flutter/foundation.dart'
    if (kIsWeb) {
      return 'Web';
    } else if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isFuchsia) {
      return 'Fuchsia';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else if (Platform.isMacOS) {
      return 'MacOS';
    } else {
      return 'Unknown';
    }
  }
}
