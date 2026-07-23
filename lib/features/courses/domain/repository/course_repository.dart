import '../../../../core/resources/either_result.dart';
import '../../data/model/course.dart';


abstract interface class CourseRepository {
  Future<EitherResult<List<Course>>> getCourses();
}
