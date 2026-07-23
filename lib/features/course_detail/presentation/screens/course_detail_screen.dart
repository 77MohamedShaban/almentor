import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/reusable_component/app_bar_widget.dart';
import '../../../courses/data/model/course.dart';
import '../cubit/course_detail_cubit.dart';
import '../widgets/error_occurred..dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<CourseDetailCubit>()
            ..initializeVideo(course.videoUrl ?? "", course.id ?? ""),
      child: Scaffold(
        appBar: AppBarWidget(
          title: StringsManager.courseDetail,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: BlocBuilder<CourseDetailCubit, CourseDetailState>(
          builder: (context, state) {
            if (state is CourseDetailLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CourseDetailErrorState) {
              return ErrorOccurred(message: state.message, videoUrl: course.videoUrl ?? '', id: course.id ?? '',);
            }

            if (state is CourseDetailSuccessState) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
                      child: AspectRatio(
                        aspectRatio: state.controller.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            VideoPlayer(state.controller),

                            GestureDetector(
                              onTap: () {
                                context.read<CourseDetailCubit>().togglePlay();
                              },
                              child: CircleAvatar(
                                radius: 32.r,
                                backgroundColor: Colors.black45,
                                child: Icon(
                                  state.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 40.r,
                                ),
                              ),
                            ),

                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: VideoProgressIndicator(
                                state.controller,
                                allowScrubbing: true,
                                colors: const VideoProgressColors(
                                  playedColor: ColorsManager.primary,
                                  bufferedColor: Colors.white30,
                                  backgroundColor: Colors.black26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    Text(
                      course.title ?? "",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    SizedBox(height: 12.h),

                    Text(
                      course.description ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    SizedBox(height: 24.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringsManager.progress,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "${(state.progress * 100).toInt()}%",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: LinearProgressIndicator(
                        value: state.progress,
                        minHeight: 8.h,
                        backgroundColor: ColorsManager.border,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.play_circle_fill,
                          color: ColorsManager.primary,
                        ),
                        title: Text(StringsManager.resumePlayback),
                        subtitle: Text(
                          "${StringsManager.continueFrom} ${_formatDuration(state.position)}",
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          if (!state.isPlaying) {
                            context.read<CourseDetailCubit>().togglePlay();
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.schedule_outlined),
                        title: Text(StringsManager.duration),
                        subtitle: Text(
                          "${state.duration.inSeconds} ${StringsManager.seconds}",
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
