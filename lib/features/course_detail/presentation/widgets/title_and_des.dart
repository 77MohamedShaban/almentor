import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndDes extends StatelessWidget {
  final String title;
  final String description;

  const TitleAndDes({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),

      SizedBox(height: 12.h),

      Text(description ,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ],);
  }
}
