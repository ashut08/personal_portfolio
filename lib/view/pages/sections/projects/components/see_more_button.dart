import 'package:flutter/material.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themProv = Provider.of<ThemeProvider>(context);
    return InkWell(
      onTap: () {
        launchUrlString(kSocialLinks[5]);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: kPrimaryColor,
            width: 1,
          ),
          color: !themProv.lightTheme ? Colors.black : Colors.white,
        ),
        child: const Text(
          "See More",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
