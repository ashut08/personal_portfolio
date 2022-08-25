import 'package:flutter/material.dart';

import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:provider/provider.dart';

class AboutMeData extends StatelessWidget {
  final String data;
  final String information;
  final Alignment? alignment;

  const AboutMeData({
    Key? key,
    required this.data,
    required this.information,
    this.alignment,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Align(
      alignment: alignment ?? Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "$data: ",
                style: const TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.w400)),
            TextSpan(
                text: " $information",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: themeProvider.lightTheme ? Colors.black : Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
