import 'package:flutter/material.dart';

import '../../../../../../core/resources/strings_Manager.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   TextField(
      decoration: InputDecoration(
        hintText: StringsManager.searchCourses,
        prefixIcon: Icon(Icons.search),
      ),
      onTapUpOutside: (_)=> FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
