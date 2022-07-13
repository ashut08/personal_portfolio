import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/animation/entrancefader.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/widgets/social_icons.dart';
import 'package:provider/provider.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height - 50,
      width: width,
      child: Stack(
        children: [
          Positioned(
            top: width < 1200 ? height * 0.15 : height * 0.1,
            right: 0,
            bottom: 20,
            child: Opacity(
              opacity: 0.9,
              child: EntranceFader(
                offset: const Offset(0, 0),
                delay: const Duration(seconds: 1),
                duration: const Duration(milliseconds: 800),
                child: Image.asset(
                  themeProvider.lightTheme
                      ? "assets/dpimage/light.png"
                      : "assets/dpimage/dark.png",
                  height: width < 1200 ? height * 0.8 : height * 0.85,
                ),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.fromLTRB(width * 0.1, height * 0.2, width * 0.1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.055,
                      color: themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text.rich(
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
                const SizedBox(
                  height: 20,
                ),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.play_arrow_rounded,
                        color: kPrimaryColor,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            ' Mobile Apps Developer',
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
                            'DevOps enthusiastic',
                            textStyle: GoogleFonts.montserrat(
                                fontSize: height * 0.035,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.1),
                            cursor: '|',
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            'UI/UX enthusiastic',
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
                    ],
                  ),
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
                        height: 60,
                        horizontalPadding: 2.0,
                      )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
