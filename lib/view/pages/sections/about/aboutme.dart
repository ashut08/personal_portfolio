import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:AshuTech/utils/screen_helper.dart';
import 'package:AshuTech/view/pages/sections/about/about_desktop.dart';
import 'package:AshuTech/view/pages/sections/about/about_mobile.dart';
import 'package:AshuTech/view/pages/sections/about/about_tab.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return const ScreenHelper(
      tablet: AboutTab(),
      desktop: AboutDesktop(),
      mobile: AboutMoile(),
    );
  }
}
