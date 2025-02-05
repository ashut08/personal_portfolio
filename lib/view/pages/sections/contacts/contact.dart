import 'package:flutter/cupertino.dart';

import 'package:AshuTech/utils/screen_helper.dart';
import 'package:AshuTech/view/pages/sections/contacts/contact_desktop.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    return const ScreenHelper(
      tablet: ContactDesktop(),
      desktop: ContactDesktop(),
      mobile: ContactDesktop(),
    );
  }
}
