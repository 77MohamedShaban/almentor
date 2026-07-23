import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/routes_manager/routes_name.dart';
import '../../../../data/model/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutesName.courseDetails,
            arguments: course,
          );
        },
        child: SizedBox(
          height: 130.h,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: course.thumbnailUrl,
                width: 120.w,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  color: ColorsManager.border,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (_, __, ___) => Container(
                  width: 120.w,
                  color: ColorsManager.border,
                  child: const Icon(Icons.broken_image_outlined),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(14.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      SizedBox(height: 8.h),

                      Row(
                        children: [
                          Icon(
                            Icons.schedule_outlined,
                            size: 16.sp,
                            color: ColorsManager.textSecondary,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            course.duration,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: LinearProgressIndicator(
                                value: course.progress,
                                minHeight: 8.h,
                              ),
                            ),
                          ),

                          SizedBox(width: 12.w),

                          Text(
                            "${(course.progress * 100).toInt()}%",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 24.sp,
                  color: ColorsManager.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
