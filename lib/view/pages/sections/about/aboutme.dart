import 'package:flutter/cupertino.dart';

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
    return const Text("About");
    // return ContianerAnimation(
    //   widget: Image.network(ur),
    // );
  }

  Widget desktop() {
    return const Text("About");
    // return Row(
    //   children: [
    //     Expanded(
    //       child: ContianerAnimation(
    //         widget: Image.network(ur),
    //         height: 200,
    //         width: 300,
    //       ),
    //     ),
    //     Expanded(
    //       child: Container(),
    //     ),
    //   ],
    // );
  }

  Widget mobile() {
    return const Text("About");
    // return ContianerAnimation(
    //   widget: Image.network(ur),
    //   height: 100,
    //   width: 100,
    // );
  }
}
