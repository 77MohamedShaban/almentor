import 'package:almentor/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/resources/strings_Manager.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: StringsManager.searchCourses,
        prefixIcon: const Icon(Icons.search),
      ),
      onChanged: (value) {
        context.read<CoursesCubit>().search(value);
      },
      onTapUpOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
