import 'package:flutter/material.dart';
import 'almentor.dart';
import 'core/remote/local/prefs_manager.dart';

void main() async {
  await PrefsManager.init();
  runApp(const Almentor());
}
