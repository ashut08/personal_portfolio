import 'package:flutter/cupertino.dart';

import 'package:personal_portfolio/utils/screen_helper.dart';
import 'package:personal_portfolio/view/pages/sections/projects/projects_desktop.dart';
import 'package:personal_portfolio/view/pages/sections/projects/projects_mobile.dart';

class MyProject extends StatefulWidget {
  const MyProject({Key? key}) : super(key: key);

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    return const ScreenHelper(
      tablet: ProjectDesktop(),
      desktop: ProjectDesktop(),
      mobile: ProjectsMobile(),
    );
  }
}
