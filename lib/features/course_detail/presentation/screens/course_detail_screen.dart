import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_Manager.dart';
import '../../../../core/reusable_component/app_bar_widget.dart';
import '../../../courses/data/model/course.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  Course? course;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    course = ModalRoute.of(context)?.settings.arguments as Course?;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.courseDetail,
        leading: GestureDetector(
            onTap: () {
             Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      body:SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Video Placeholder
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_circle_fill_rounded,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Text(
              course?.title??"",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: 12.h),

            Text(
              course?.description??"",
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
                  "45%",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),

            SizedBox(height: 10.h),

            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: const LinearProgressIndicator(
                value: .45,
                minHeight: 8,
              ),
            ),

            SizedBox(height: 24.h),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.play_circle_fill_rounded,
                  color: ColorsManager.primary,
                ),
                title:  Text(StringsManager.resumePlayback),
                subtitle:  Text("${StringsManager.continueFrom} 00:14"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),

            SizedBox(height: 16.h),

            Card(
              child: ListTile(
                leading: const Icon(Icons.schedule_outlined),
                title:  Text(StringsManager.duration),
                subtitle:  Text("30 ${StringsManager.seconds}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
