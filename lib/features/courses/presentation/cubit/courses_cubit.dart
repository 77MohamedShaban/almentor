import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/resources/either_result.dart';
import '../../data/model/course.dart';
import '../../domain/usecase/get_courses_usecase.dart';

part 'courses_state.dart';

@injectable
class CoursesCubit extends Cubit<CoursesState> {
  final GetCoursesUseCase getCoursesUseCase;
  CoursesCubit(this.getCoursesUseCase) : super(CoursesInitial());

  List<Course> _allCourses = [];

  Future<void> getCourses() async {
    emit(CoursesLoadingState());
    final result = await getCoursesUseCase.call();

    switch(result) {
      case Success<List<Course>>():
        _allCourses = result.response;
        emit(CoursesSuccessState(_allCourses));
      case Failure<List<Course>>():
        emit(CoursesErrorState(result.message));
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(CoursesSuccessState(_allCourses));
    } else {
      final filteredCourses = _allCourses
          .where((course) =>
              course.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
      emit(CoursesSuccessState(filteredCourses));
    }
  }
}
