import 'package:flutter/cupertino.dart';

import 'package:AshuTech/utils/screen_helper.dart';
import 'package:AshuTech/view/pages/sections/services/service_desktop.dart';
import 'package:AshuTech/view/pages/sections/services/mobile_service.dart';
import 'package:AshuTech/view/pages/sections/services/services_tab.dart';

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
