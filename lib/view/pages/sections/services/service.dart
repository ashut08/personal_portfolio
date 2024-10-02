import 'package:flutter/cupertino.dart';

import 'package:AshuTech/utils/screen_helper.dart';
import 'package:AshuTech/view/pages/sections/services/service_desktop.dart';
import 'package:AshuTech/view/pages/sections/services/mobile_service.dart';

class MyServices extends StatefulWidget {
  const MyServices({super.key});

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  @override
  Widget build(BuildContext context) {
    return const ScreenHelper(
      tablet: ServiceDesktop(),
      desktop: ServiceDesktop(),
      mobile: ServiceDesktop(),
    );
  }
}
