import 'package:almentor/core/routes_manager/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../features/course_detail/presentation/screens/course_detail_screen.dart';
import '../../features/courses/presentation/screens/course_list_screen.dart';
import '../../features/courses/data/model/course.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.courseList:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const CourseListScreen(),
          settings: settings,
        );
      case RoutesName.courseDetails:
        final course = settings.arguments as Course;
        return PageTransition(
          type: PageTransitionType.fade,
          child: CourseDetailScreen(course: course),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
