import 'package:flutter/cupertino.dart';
import 'package:personal_portfolio/animation/container_animation.dart';
import 'package:personal_portfolio/utils/constant.dart';

import 'package:personal_portfolio/utils/screen_helper.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      tablet: tablet(),
      desktop: desktop(),
      mobile: mobile(),
    );
  }

  Widget tablet() {
    return ContianerAnimation(
      widget: Image.network(ur),
    );
  }

  Widget desktop() {
    return ContianerAnimation(
      widget: Image.network(ur),
      height: 200,
      width: 300,
    );
  }

  Widget mobile() {
    return ContianerAnimation(
      widget: Image.network(ur),
      height: 100,
      width: 100,
    );
  }
}
