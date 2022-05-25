import 'package:flutter/cupertino.dart';

import 'package:personal_portfolio/utils/screen_helper.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      tablet: tablet(),
      desktop: desktop(),
      mobile: mobile(),
    );
  }

  Widget tablet() {
    return Container(child: Text("tablet"));
  }

  Widget desktop() {
    return Container(child: Text("desktop"));
  }

  Widget mobile() {
    return Container(child: Text("mobile"));
  }
}
