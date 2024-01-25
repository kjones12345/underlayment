// android_back_button_handler.dart
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class AndroidBackButtonHandler extends StatelessWidget {
  final Widget child;
  final VoidCallback? onBack;

  AndroidBackButtonHandler({required this.child, this.onBack});

  @override
  Widget build(BuildContext context) {
    // Check if the platform is Android
    if (Platform.isAndroid) {
      return WillPopScope(
        onWillPop: () async {
          onBack?.call();
          return false; // Indicates that the pop is handled manually
        },
        child: child,
      );
    } else {
      // For non-Android platforms, return the child directly
      return child;
    }
  }
}
