import 'package:flutter/material.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/view/pages/sections/contacts/components/all_contact_link.dart';
import 'package:AshuTech/view/pages/sections/contacts/components/contact_form.dart';
import 'package:provider/provider.dart';

class ContactMobile extends StatelessWidget {
  const ContactMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final themProv = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Text(
                "Contact".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: height * 0.055,
                  color: themProv.lightTheme
                      ? Colors.black.withOpacity(0.2)
                      : Colors.white.withOpacity(0.2),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              child: Text(
                "Send Message",
                style: TextStyle(
                  fontSize: height * 0.025,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        size10,
        size10,
        const ContactForm(),
        const AllContactLink()
      ],
    );
  }
}
