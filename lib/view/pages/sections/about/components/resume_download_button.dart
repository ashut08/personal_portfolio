import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/about_utils.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeDownloadButton extends StatefulWidget {
  const ResumeDownloadButton({Key? key}) : super(key: key);

  @override
  State<ResumeDownloadButton> createState() => _ResumeDownloadButtonState();
}

class _ResumeDownloadButtonState extends State<ResumeDownloadButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(5),
      // height: 50,
      width: 170,
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(8),
          color: isHover
              ? kPrimaryColor
              : themeProvider.lightTheme
                  ? Colors.white
                  : Colors.black),
      child: InkWell(
        onTap: () async {
        
          launchUrl(
            Uri.parse(AboutUtils.resumeurl),
          );
        },
        onHover: (value) {
          if (value) {
            setState(() {
              isHover = true;
            });
          } else {
            setState(() {
              isHover = false;
            });
          }
        },
        child: Row(children: [
          SvgPicture.asset(
            "assets/inbox-solid.svg",
            height: 20,
            color: isHover ? Colors.white : kPrimaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Download CV",
            style: TextStyle(
              color: isHover ? Colors.white : kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          )
        ]),
      ),
    );
  }
}
