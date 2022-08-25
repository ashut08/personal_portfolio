import 'package:flutter/cupertino.dart';

import 'package:AshuTech/utils/screen_helper.dart';
import 'package:AshuTech/view/pages/sections/contacts/contact_desktop.dart';
import 'package:AshuTech/view/pages/sections/contacts/contacts_mobile.dart';
import 'package:AshuTech/view/pages/sections/contacts/contacts_tab.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    return const ScreenHelper(
      tablet: ContactTab(),
      desktop: ContactDesktop(),
      mobile: ContactMobile(),
    );
  }
}
