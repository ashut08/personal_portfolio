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
            right: width * 0.01,
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

    // Row(
    //   children: [
    //     Expanded(child: aboutSectionWidget(height, themeProvider)),
    //     Expanded(
    //       flex: 1,
    //       child: Container(
    //         color: themeProvider.lightTheme ? Colors.white : Colors.black,
    //         child: Image.network(
    //           "https://previews.123rf.com/images/hozard/hozard1809/hozard180900030/108682479-horizontal-headshot-of-young-handsome-european-caucasian-man-pictured-isolated-on-grey-background-we.jpg",
    //           height: height,
    //           fit: BoxFit.fill,
    //           width: width,
    //         ),
    //       ),
    //     ),
    //   ],
    // );

    // Container(
    //   height: size.height * 1.25,
    //   padding: Space.h,
    //   child: Stack(
    //     children: [
    //       Positioned(
    //         right: 0,
    //         bottom: 0,
    //         child: Opacity(
    //           opacity: 0.9,
    //           child: EntranceFader(
    //             offset: const Offset(0, 0),
    //             delay: const Duration(seconds: 1),
    //             duration: const Duration(milliseconds: 800),
    //             child: Image.asset(
    //               themeProvider.lightTheme
    //                   ? "assets/dpimage/light.png"
    //                   : "assets/dpimage/dark.png",
    //               height: size.width < 1200
    //                   ? size.height * 0.8
    //                   : size.height * 0.85,
    //             ),
    //           ),
    //         ),
    //       ),
    //       Center(
    //         child: Container(
    //           margin: EdgeInsets.fromLTRB(
    //             AppDimensions.normalize(30),
    //             AppDimensions.normalize(80),
    //             0,
    //             0,
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Text(
    //                 "Hello",
    //                 textAlign: TextAlign.center,
    //                 style: GoogleFonts.montserrat(
    //                     fontSize: height! * 0.055,
    //                     color: themeProvider.lightTheme
    //                         ? Colors.black
    //                         : Colors.white,
    //                     fontWeight: FontWeight.w600),
    //               ),
    //               SizedBox(
    //                 height: height * 0.01,
    //               ),
    //               Center(
    //                 child: Text.rich(
    //                   TextSpan(
    //                     children: [
    //                       TextSpan(
    //                         text: 'I am  ',
    //                         style: GoogleFonts.montserrat(
    //                             fontSize: height * 0.055,
    //                             color: themeProvider.lightTheme
    //                                 ? Colors.black
    //                                 : Colors.white,
    //                             fontWeight: FontWeight.w600,
    //                             letterSpacing: 1.1),
    //                       ),
    //                       TextSpan(
    //                         text: ' Ashutosh',
    //                         style: GoogleFonts.montserrat(
    //                             fontSize: height * 0.055,
    //                             color: kPrimaryColor,
    //                             fontWeight: FontWeight.w900,
    //                             letterSpacing: 1.1),
    //                       ),
    //                       TextSpan(
    //                         text: ' Singh',
    //                         style: GoogleFonts.montserrat(
    //                             fontSize: height * 0.055,
    //                             color: themeProvider.lightTheme
    //                                 ? Colors.black
    //                                 : Colors.white,
    //                             fontWeight: FontWeight.w600,
    //                             letterSpacing: 1.1),
    //                       ),
    //                     ],
    //                   ),
    //                   textAlign: TextAlign.center,
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //               EntranceFader(
    //                 offset: const Offset(-10, 0),
    //                 delay: const Duration(seconds: 1),
    //                 duration: const Duration(milliseconds: 800),
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     const Icon(
    //                       Icons.play_arrow_rounded,
    //                       color: kPrimaryColor,
    //                     ),
    //                     AnimatedTextKit(
    //                       animatedTexts: [
    //                         TypewriterAnimatedText(
    //                           'I\'m  Mobile App Developer',
    //                           textStyle: GoogleFonts.montserrat(
    //                               fontSize: height * 0.035,
    //                               color: kPrimaryColor,
    //                               fontWeight: FontWeight.w900,
    //                               letterSpacing: 1.1),
    //                           cursor: '|',
    //                           speed: const Duration(milliseconds: 100),
    //                         ),
    //                         TypewriterAnimatedText(
    //                           'Flutter Developer',
    //                           textStyle: GoogleFonts.montserrat(
    //                               fontSize: height * 0.035,
    //                               color: kPrimaryColor,
    //                               fontWeight: FontWeight.w900,
    //                               letterSpacing: 1.1),
    //                           cursor: ' | ',
    //                           speed: const Duration(milliseconds: 100),
    //                         ),
    //                         TypewriterAnimatedText(
    //                           'Technical Writer',
    //                           textStyle: GoogleFonts.montserrat(
    //                               fontSize: height * 0.035,
    //                               color: kPrimaryColor,
    //                               fontWeight: FontWeight.w900,
    //                               letterSpacing: 1.1),
    //                           cursor: '|',
    //                           speed: const Duration(milliseconds: 100),
    //                         ),
    //                         TypewriterAnimatedText(
    //                           'Hello world!',
    //                           textStyle: GoogleFonts.montserrat(
    //                               fontSize: height * 0.035,
    //                               color: kPrimaryColor,
    //                               fontWeight: FontWeight.w900,
    //                               letterSpacing: 1.1),
    //                           cursor: '|',
    //                           speed: const Duration(milliseconds: 100),
    //                         ),
    //                       ],
    //                       totalRepeatCount: 100,
    //                       isRepeatingAnimation: true,
    //                       repeatForever: true,
    //                       pause: const Duration(milliseconds: 1000),
    //                       displayFullTextOnTap: true,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: height * 0.035,
    //               ),
    //               //  aboutMe(),
    //               SizedBox(
    //                 height: height * 0.035,
    //               ),
    //               Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   for (int i = 0; i < kSocialIcons.length; i++)
    //                     SocialMediaIcon(
    //                       icon: kSocialIcons[i],
    //                       socialLink: kSocialLinks[i],
    //                       height: height * 0.03,
    //                       horizontalPadding: 2.0,
    //                     )
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
