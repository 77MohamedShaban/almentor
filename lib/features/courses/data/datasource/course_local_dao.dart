import 'package:almentor/core/resources/either_result.dart';

import '../model/course.dart';

abstract class CourseLocalDao {
  Future<EitherResult<List<Course>>> getCourses();
}