import 'package:almentor/core/resources/strings_Manager.dart';
import 'package:almentor/features/courses/presentation/screens/course_list/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsManager.courses,
        ),
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: REdgeInsetsDirectional.only(end: 16),
            child: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body:  Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: StringsManager.searchCourses,
                prefixIcon: Icon(Icons.search),
              ),
            ),

            SizedBox(height: 24.h),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
               StringsManager.allCourses ,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            SizedBox(height: 16.h),

            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (_,_) => SizedBox(height: 16.h),
                itemBuilder: (_, index) {
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
