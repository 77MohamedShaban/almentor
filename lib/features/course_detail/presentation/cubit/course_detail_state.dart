part of 'course_detail_cubit.dart';

@immutable
sealed class CourseDetailState {}

final class CourseDetailInitial extends CourseDetailState {}

final class CourseDetailLoadingState extends CourseDetailState {}

final class CourseDetailSuccessState extends CourseDetailState {
  final VideoPlayerController controller;
  final bool isPlaying;
  final Duration position;
  final Duration duration;
  final double progress;

  CourseDetailSuccessState({
    required this.controller,
    required this.isPlaying,
    required this.position,
    required this.duration,
    required this.progress,
  });

  CourseDetailSuccessState copyWith({
    VideoPlayerController? controller,
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    double? progress,
  }) {
    return CourseDetailSuccessState(
      controller: controller ?? this.controller,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      progress: progress ?? this.progress,
    );
  }
}

final class CourseDetailErrorState extends CourseDetailState {
  final String message;

  CourseDetailErrorState(this.message);
}
