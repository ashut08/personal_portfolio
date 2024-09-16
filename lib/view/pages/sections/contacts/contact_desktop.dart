import 'package:AshuTech/widgets/divider.dart';
import 'package:AshuTech/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/view/pages/sections/contacts/components/all_contact_link.dart';
import 'package:AshuTech/view/pages/sections/contacts/components/contact_form.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final themProv = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomDivider(
              height: 4,
              width: 33,
            ),
            const SizedBox(
              width: 10,
            ),
            GradientText(
              "Contact Me",
              gradient: primaryGradientColor,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              width: 10,
            ),
            const CustomDivider(
              height: 4,
              width: 33,
            ),
          ],
        ),
        const Column(
          children: [ContactForm(), AllContactLink()],
        )
      ],
    );
  }
}
