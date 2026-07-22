import 'package:flutter/material.dart';
import 'almentor.dart';
import 'core/remote/local/prefs_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefsManager.init();
  runApp(const Almentor());

}
