import 'package:almentor/core/di/di.dart';
import 'package:almentor/core/resources/strings_manager.dart';
import 'package:almentor/core/reusable_component/app_bar_widget.dart';
import 'package:almentor/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/course_card.dart';
import '../widgets/search.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CoursesCubit>()..getCourses(),
      child: Scaffold(
        appBar: AppBarWidget(
          title: StringsManager.courses,
          leading: const Icon(Icons.menu),
          actions: [
            Padding(
              padding: REdgeInsetsDirectional.only(end: 16),
              child: const Icon(Icons.notifications_none),
            ),
          ],
        ),
        body: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            children: [
              const Search(),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  StringsManager.allCourses,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<CoursesCubit, CoursesState>(
                  builder: (context, state) {
                    if (state is CoursesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CoursesErrorState) {
                      return Center(child: Text(state.message));
                    } else if (state is CoursesSuccessState) {
                      return ListView.separated(
                        itemCount: state.data.length,
                        separatorBuilder: (_, _) => SizedBox(height: 16.h),
                        itemBuilder: (_, index) {
                          return CourseCard(course: state.data[index]);
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
