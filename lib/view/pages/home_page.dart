import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/sizeconfig.dart';
import 'package:personal_portfolio/widgets/social_icons.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    return Stack(
      children: [
        ///background image
        ///
        Image.network(
          "https://previews.123rf.com/images/hozard/hozard1809/hozard180900030/108682479-horizontal-headshot-of-young-handsome-european-caucasian-man-pictured-isolated-on-grey-background-we.jpg",
          height: height,
          fit: BoxFit.cover,
          width: width,
        ),

        ///about section start here
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Hello",
                style: GoogleFonts.montserrat(
                    fontSize: height! * 0.025,
                    color:
                        themeProvider.lightTheme ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w200),
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
                          fontWeight: FontWeight.w100,
                          letterSpacing: 1.1),
                    ),
                    TextSpan(
                      text: ' Ashutosh',
                      style: GoogleFonts.montserrat(
                          fontSize: height * 0.055,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 1.1),
                    ),
                    TextSpan(
                      text: ' Singh',
                      style: GoogleFonts.montserrat(
                          fontSize: height * 0.055,
                          color: themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 1.1),
                    ),
                  ],
                ),
              ),

              /// animate text start here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'I\'m  Mobile App Developer',
                        textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                        cursor: '|',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Flutter Developer',
                        textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                        cursor: ' | ',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Techniacal Writer',
                        textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                        cursor: '|',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Hello world!',
                        textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                        cursor: '|',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  )
                ],
              ),
              SizedBox(
                height: height * 0.035,
              ),
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
              )
            ],
          ),
        )
      ],
    );
  }
}
