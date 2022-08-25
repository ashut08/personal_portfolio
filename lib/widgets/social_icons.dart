import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/screen_helper.dart';
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
        onPressed: () async {
          await FirebaseAnalytics.instance.logEvent(
            name: 'Click Social media Profile',
            parameters: <String, dynamic>{
              'social_media_icon': icon,
              'social_media_link': socialLink,
            },
          );
          url.launchUrl(Uri.parse(socialLink!));
        },
        hoverColor: Colors.transparent,
      ),
    );
  }
}
