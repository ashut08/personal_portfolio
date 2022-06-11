import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/widgets/social_icons.dart';

Container aboutSectionWidget(double? height, ThemeProvider themeProvider) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Hello",
          style: GoogleFonts.montserrat(
              fontSize: height! * 0.055,
              color: themeProvider.lightTheme ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'I am  ',
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.055,
                      color: themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1),
                ),
                TextSpan(
                  text: ' Ashutosh',
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.055,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.1),
                ),
                TextSpan(
                  text: ' Singh',
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.055,
                      color: themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),

        /// animate text start here
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'I\'m  Mobile App Developer',
              textStyle: GoogleFonts.montserrat(
                  fontSize: height * 0.035,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.1),
              cursor: '|',
              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              'Flutter Developer',
              textStyle: GoogleFonts.montserrat(
                  fontSize: height * 0.035,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.1),
              cursor: ' | ',
              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              'Technical Writer',
              textStyle: GoogleFonts.montserrat(
                  fontSize: height * 0.035,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.1),
              cursor: '|',
              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              'Hello world!',
              textStyle: GoogleFonts.montserrat(
                  fontSize: height * 0.035,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.1),
              cursor: '|',
              speed: const Duration(milliseconds: 100),
            ),
          ],
          totalRepeatCount: 100,
          isRepeatingAnimation: true,
          repeatForever: true,
          pause: const Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
        ),
        SizedBox(
          height: height * 0.035,
        ),
        //  aboutMe(),
        SizedBox(
          height: height * 0.035,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < kSocialIcons.length; i++)
              SocialMediaIcon(
                icon: kSocialIcons[i],
                socialLink: kSocialLinks[i],
                height: height * 0.03,
                horizontalPadding: 2.0,
              )
          ],
        ),
      ],
    ),
  );
}
