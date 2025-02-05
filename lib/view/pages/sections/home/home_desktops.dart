import 'package:AshuTech/utils/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:AshuTech/animation/entrancefader.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/widgets/social_icons.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/gradient_text.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: Container(
            margin:
                EdgeInsets.fromLTRB(width * 0.1, height * 0.1, width * 0.1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to my portfolio",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Row(
                  children: [
                    Text(
                      "Hi!, I’m",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GradientText(
                      "Ashutosh Singh",
                      gradient: primaryGradientColor,
                      style: Theme.of(context).textTheme.displayLarge,
                    )
                  ],
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
                            ' ',
                            textStyle: GoogleFonts.openSans(
                                fontSize: height * 0.045,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.1),
                            cursor: '|',
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            'Flutter Developer',
                            textStyle: GoogleFonts.openSans(
                                fontSize: height * 0.045,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.1),
                            cursor: ' | ',
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            'Technical Writer',
                            textStyle: GoogleFonts.openSans(
                                fontSize: height * 0.045,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.1),
                            cursor: '|',
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            'DevOps enthusiastic',
                            textStyle: GoogleFonts.openSans(
                                fontSize: height * 0.045,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.1),
                            cursor: '|',
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            'UI/UX enthusiastic',
                            textStyle: GoogleFonts.openSans(
                                fontSize: height * 0.045,
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
                  height: height * 0.045,
                ),
                //  aboutMe(),
                Text(
                  '''I am a Mobile Apps developer with over 4+ years of specialized experience in cross-platform mobile development. My core expertise lies in building robust, high-performance applications using Flutter, Kotlin, and Swift. I have a proven track record of optimizing UI/UX and integrating complex backend services like Firebase and AWS Amplify to deliver scalable and user-centric solutions. I am dedicated to driving innovation and excellence in every project I undertake.''',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: height * 0.045,
                ),
                //
                Text(
                  "Get In Touch",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                //
                Container(
                  padding: EdgeInsets.all(height * 0.02),
                  decoration: BoxDecoration(
                    color:
                        themeProvider.lightTheme ? Colors.white : Colors.black,
                    border: Border.all(color: Colors.purple),

                    //themeProvider.lightTheme ? Colors.white : Colors.black,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(80),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < ksocialData.length; i++)
                        SocialMediaIcon(
                          icon: ksocialData[i].icon,
                          socialLink: ksocialData[i].link,
                          height: height * 0.03,
                          horizontalPadding: 2.0,
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Opacity(
          opacity: 0.9,
          child: EntranceFader(
            offset: const Offset(0, 0),
            delay: const Duration(seconds: 1),
            duration: const Duration(milliseconds: 800),
            child: Image.asset(
              "assets/dpimage/profile1.png",
              height: width < 1200 ? height * 0.8 : height * 0.85,
            ),
          ),
        ),
      ],
    );
  }
}
