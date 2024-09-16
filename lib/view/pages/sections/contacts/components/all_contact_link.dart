import 'package:AshuTech/config/space.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/about_utils.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/colors.dart';

class AllContactLink extends StatelessWidget {
  const AllContactLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          buildTile("assets/newicon/location.svg", "Location",
              AboutUtils.addreess, context),
          const Spacer(
            flex: 2,
          ),
          buildTile(
              "assets/newicon/email.svg", "Email", AboutUtils.email, context),
          const Spacer(
            flex: 2,
          ),
          buildTile("assets/newicon/contact.svg", "Phone", AboutUtils.mobileNo,
              context),
        ],
      ),
    );
  }

  buildTile(
      String image, String name, String description, BuildContext context) {
    return SizedBox(
      width: 400,
      child: DottedBorder(
        dashPattern: const <double>[4, 1],
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        color: kPrimaryColor,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              SvgPicture.asset(
                image,
                height: 30,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(name, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 5,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
