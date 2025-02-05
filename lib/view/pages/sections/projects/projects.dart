import 'package:flutter/cupertino.dart';

import 'package:AshuTech/utils/screen_helper.dart';
import 'package:AshuTech/view/pages/sections/projects/projects_desktop.dart';
import 'package:AshuTech/view/pages/sections/projects/projects_mobile.dart';

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    return const ScreenHelper(
      tablet: ProjectDesktop(),
      desktop: ProjectDesktop(),
      mobile: ProjectDesktop(),
    );
  }
}
