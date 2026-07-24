import 'package:almentor/features/courses/domain/repository/course_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/resources/either_result.dart';
import '../datasource/course_local_dao.dart';
import '../model/course.dart';

@Injectable(as: CourseRepository)
class CourseRepositoryImpl implements CourseRepository {
  final CourseLocalDao localDataSource;

  CourseRepositoryImpl({required this.localDataSource});

  @override
  Future<EitherResult<List<Course>>> getCourses() async {
    final remoteCourses = await localDataSource.getCourses();
    return remoteCourses;
  }
}
