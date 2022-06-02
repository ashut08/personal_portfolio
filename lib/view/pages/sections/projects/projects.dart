import 'package:flutter/cupertino.dart';

import 'package:personal_portfolio/utils/screen_helper.dart';

class MyProject extends StatefulWidget {
  const MyProject({Key? key}) : super(key: key);

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      tablet: tablet(),
      desktop: desktop(),
      mobile: mobile(),
    );
  }

  Widget tablet() {
    return const Text("Projects");
  }

  Widget desktop() {
    return const Text("Projects");
  }

  Widget mobile() {
    return const Text("Projects");
  }
}
