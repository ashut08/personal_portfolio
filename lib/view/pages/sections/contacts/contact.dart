import 'package:flutter/cupertino.dart';

import 'package:personal_portfolio/utils/screen_helper.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      tablet: tablet(),
      desktop: desktop(),
      mobile: mobile(),
    );
  }

  Widget tablet() {
    return const Text("Contact");
  }

  Widget desktop() {
    return const Text("Contact");
  }

  Widget mobile() {
    // ignore: avoid_unnecessary_containers
    return Container(child: const Text("Contact"));
  }
}
