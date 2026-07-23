import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String _coursePositionKey = 'course_position_';
  static const String _courseProgressKey = 'course_progress_';

  static Future<void> saveCoursePosition(String courseId, int seconds) async {
    await prefs.setInt('$_coursePositionKey$courseId', seconds);
  }

  static int getCoursePosition(String courseId) {
    return prefs.getInt('$_coursePositionKey$courseId') ?? 0;
  }

  static Future<void> saveCourseProgress(String courseId, double progress) async {
    await prefs.setDouble('$_courseProgressKey$courseId', progress);
  }

  static double getCourseProgress(String courseId) {
    return prefs.getDouble('$_courseProgressKey$courseId') ?? 0.0;
  }
}
