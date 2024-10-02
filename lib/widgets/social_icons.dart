import 'package:AshuTech/utils/colors.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart' as url;

import 'package:provider/provider.dart';

class SocialMediaIcon extends StatefulWidget {
  final String? icon;
  final String? socialLink;
  final double? height;
  final double? horizontalPadding;

  const SocialMediaIcon({
    super.key,
    this.icon,
    this.socialLink,
    this.height,
    this.horizontalPadding,
  });

  @override
  _SocialMediaIconState createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<SocialMediaIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding!),
      child: MouseRegion(
        onEnter: (event) => _onHover(true),
        onExit: (event) => _onHover(false),
        child: IconButton(
          icon: Container(
            width: ScreenHelper.isDesktop(context) ? 80 : 30,
            padding: EdgeInsets.all(ScreenHelper.isDesktop(context) ? 8 : 5),
            height: ScreenHelper.isDesktop(context) ? 80 : 40,
            child: _isHovered
                ? ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: gradientColor,
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                      // : const LinearGradient(
                      //     colors: [Colors.transparent, Colors.transparent],
                      //   ).createShader(bounds);
                    },
                    child: SvgPicture.asset(
                      widget.icon!,
                      color: Colors.grey,
                      //  color: _isHovered ? null : themeProvider.isDarkMode ? Colors.white : Colors.black, // Normal color
                    ),
                  )
                : SvgPicture.asset(
                    widget.icon!,
                    color:
                        themeProvider.lightTheme ? Colors.black : Colors.white,
                    //  color: _isHovered ? null : themeProvider.isDarkMode ? Colors.white : Colors.black, // Normal color
                  ),
          ),
          iconSize: widget.height,
          onPressed: () async {
            
            url.launchUrl(Uri.parse(widget.socialLink!));
          },
          hoverColor: Colors.transparent,
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
