import 'package:flutter/material.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/about_utils.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:provider/provider.dart';

class AboutMeHeader extends StatelessWidget {
  const AboutMeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final themProv = Provider.of<ThemeProvider>(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Center(
          child: Text(
            "About Me".toUpperCase(),
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
            AboutUtils.aboutMeHeadline,
            style: TextStyle(
              fontSize: height * 0.025,
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
