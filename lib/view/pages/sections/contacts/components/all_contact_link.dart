import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/about_utils.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:provider/provider.dart';

class AllContactLink extends StatelessWidget {
  const AllContactLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            buildTile("assets/street-view-solid.svg", "Location",
                AboutUtils.addreess, context),
            size10,
            const Divider(
              height: 12,
              color: kPrimaryColor,
            ),
            size10,
            buildTile("assets/envelope-solid.svg", "Email", AboutUtils.email,
                context),
            size10,
            const Divider(
              height: 12,
              color: kPrimaryColor,
            ),
            size10,
            buildTile("assets/phone-alt-solid.svg", "Phone",
                AboutUtils.mobileNo, context),
            size10,
            // const Divider(
            //   height: 12,
            //   color: kPrimaryColor,
            // )
          ],
        ),
      ),
    );
  }

  buildTile(
      String image, String name, String description, BuildContext context) {
    final themeProv = Provider.of<ThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          image,
          height: 30,
          color: kPrimaryColor,
        ),
        Column(
          children: [
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: themeProv.lightTheme ? Colors.black : Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              description,
              style: const TextStyle(
                color: kSecondryColor,
              ),
            )
          ],
        )
      ],
    );
  }
}
