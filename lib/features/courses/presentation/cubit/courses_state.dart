part of 'courses_cubit.dart';

@immutable
sealed class CoursesState {}

final class CoursesInitial extends CoursesState {}

final class CoursesSuccessState extends CoursesState {
  final List<Course> data;
  final DateTime? timestamp; // Added to force rebuild
  CoursesSuccessState(this.data, {this.timestamp});
}

final class CoursesLoadingState extends CoursesState {}

final class CoursesErrorState extends CoursesState {
  final String message;
  CoursesErrorState(this.message);
}
