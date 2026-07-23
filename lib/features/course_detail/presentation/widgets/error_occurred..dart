import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/course_detail_cubit.dart';

class ErrorOccurred extends StatelessWidget {
  final String message;
  final String videoUrl;
  final String id;

  const ErrorOccurred({
    super.key,
    required this.message,
    required this.videoUrl,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 70.r),

            SizedBox(height: 16.h),

            Text(message, textAlign: TextAlign.center),

            SizedBox(height: 24.h),

            ElevatedButton(
              onPressed: () {
                context.read<CourseDetailCubit>().initializeVideo(videoUrl, id);
              },
              child: const Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}
