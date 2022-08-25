import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:AshuTech/animation/entrancefader.dart';
import 'package:AshuTech/config/app_dimension.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:AshuTech/widgets/social_icons.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      height: height! * 1.02,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
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
                  height: width! < 1200 ? height * 0.75 : height * 0.85,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              AppDimensions.normalize(10),
              AppDimensions.normalize(50),
              0,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                const SizedBox(
                  height: 20,
                ),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.play_arrow_rounded,
                        color: kPrimaryColor,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            ' Mobile App Developer',
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
                        height: height * 0.03,
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
