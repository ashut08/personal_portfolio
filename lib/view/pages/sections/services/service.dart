import 'package:flutter/cupertino.dart';

import 'package:personal_portfolio/utils/screen_helper.dart';
import 'package:personal_portfolio/view/pages/sections/services/mobile_desktop.dart';
import 'package:personal_portfolio/view/pages/sections/services/mobile_service.dart';
import 'package:personal_portfolio/view/pages/sections/services/mobile_tab.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  @override
  Widget build(BuildContext context) {
    return const ScreenHelper(
      tablet: ServiceTab(),
      desktop: ServiceDesktop(),
      mobile: ServiceMobile(),
    );
  }
}
