import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/resources/app_theme.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes_name.dart';

class Almentor extends StatelessWidget {
  const Almentor({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'almentor',
        theme: AppTheme.lightTheme,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: RoutesName.courseList,
      ),
    );
  }
}