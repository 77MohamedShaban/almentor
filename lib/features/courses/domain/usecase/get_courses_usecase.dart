import 'package:almentor/features/courses/domain/repository/course_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/either_result.dart';
import '../../data/model/course.dart';
@injectable
class GetCoursesUseCase {
  final CourseRepository repository;

  GetCoursesUseCase(this.repository);

  Future<EitherResult<List<Course>>> call() async {
    return await repository.getCourses();
  }
}
