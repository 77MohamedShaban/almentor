import 'dart:convert';
import 'package:almentor/features/courses/data/model/course.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/resources/either_result.dart';
import 'course_local_dao.dart';

@Injectable(as: CourseLocalDao)
class CourseLocalDaoImpl implements CourseLocalDao {
  @override
  Future<EitherResult<List<Course>>> getCourses() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/courses.json',
      );
      final data = await json.decode(response);
      final List courses = data['courses'];
      return Success(courses.map((json) => Course.fromJson(json)).toList());
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
