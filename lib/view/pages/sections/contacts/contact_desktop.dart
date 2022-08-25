import 'package:flutter/material.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/view/pages/sections/contacts/components/all_contact_link.dart';
import 'package:AshuTech/view/pages/sections/contacts/components/contact_form.dart';
import 'package:provider/provider.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);

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
                  fontSize: height * 0.075,
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
                  fontSize: height * 0.035,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        size10,
        size10,
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Expanded(
                child: AllContactLink(),
              ),
              // Flexible(
              //   child: Container(
              //     color: kPrimaryColor,
              //     width: 10,
              //     //height: double.infinity,
              //   ),
              // ),
              Expanded(child: ContactForm())
            ],
          ),
        )
      ],
    );
  }
}
