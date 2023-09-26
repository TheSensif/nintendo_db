import 'dart:io' show Platform;
import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'app_data.dart';

void main() async {
  try {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      WidgetsFlutterBinding.ensureInitialized();
      await WindowManager.instance.ensureInitialized();
      showWindow(); // Llama a la función showWindow
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
  runApp(ChangeNotifierProvider(
    create: (context) => AppData(),
    child: const App(),
  ));
}

void showWindow() async {
  await windowManager.waitUntilReadyToShow();
  windowManager.setMinimumSize(const Size(300.0, 600.0));
  await windowManager.setTitle('App');
}
