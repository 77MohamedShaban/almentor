import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_Manager.dart';
import '../cubit/course_detail_cubit.dart';

class ResumePlayback extends StatelessWidget {
  final  Duration position;
  final bool isPlaying;

  const ResumePlayback({super.key, required this.position,required this.isPlaying});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.play_circle_fill,
          color: ColorsManager.primary,
        ),
        title: Text(StringsManager.resumePlayback),
        subtitle: Text(
          "${StringsManager.continueFrom} ${_formatDuration(position)}",
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          if (!isPlaying) {
            context.read<CourseDetailCubit>().togglePlay();
          }
        },
      ),
    );
  }
  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
