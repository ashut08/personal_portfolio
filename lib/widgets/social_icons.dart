import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart' as url;

import 'package:provider/provider.dart';

class SocialMediaIcon extends StatelessWidget {
  final String? icon;
  final String? socialLink;
  final double? height;
  final double? horizontalPadding;

  const SocialMediaIcon({
    Key? key,
    this.icon,
    this.socialLink,
    this.height,
    this.horizontalPadding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding!),
      child: IconButton(
        icon: Container(
          padding: EdgeInsets.all(ScreenHelper.isDesktop(context) ? 8 : 5),
          height: ScreenHelper.isDesktop(context) ? 80 : 40,
          decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              color: themeProvider.lightTheme ? Colors.white : Colors.black,
              shape: BoxShape.circle),
          child: SvgPicture.asset(
            icon!,
            color: kPrimaryColor,
            //    height: ScreenHelper.isDesktop(context) ? 80 : 40,
          ),
        ),
        iconSize: height,
        onPressed: () => url.launchUrl(Uri.parse(socialLink!)),
        hoverColor: Colors.transparent,
      ),
    );
  }
}
