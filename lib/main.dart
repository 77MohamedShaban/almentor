import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'almentor.dart';
import 'core/di/di.dart';
import 'core/remote/local/prefs_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await PrefsManager.init();
  configureDependencies();
  runApp(const Almentor());

}
