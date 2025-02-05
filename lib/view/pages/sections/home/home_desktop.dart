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

import '../../../../utils/colors.dart';
import '../../../../widgets/gradient_text.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Opacity(
          opacity: 0.9,
          child: EntranceFader(
            offset: const Offset(0, 0),
            delay: const Duration(seconds: 1),
            duration: const Duration(milliseconds: 800),
            child: Image.asset(
              "assets/dpimage/profile1.png",
              height: width! < 1200 ? height! * 0.65 : height! * 0.85,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            size10,
            size10,
            Text(
              "Welcome to my portfolio",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi!, I’m",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GradientText(
                    "Ashutosh Singh",
                    gradient: primaryGradientColor,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
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
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                        cursor: '|',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Flutter Developer',
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                        cursor: ' | ',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Technical Writer',
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                        cursor: '|',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'DevOps enthusiastic',
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                        cursor: '|',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'UI/UX enthusiastic',
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
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
              decoration: BoxDecoration(
                color: themeProvider.lightTheme ? Colors.white : Colors.black,
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
                      height: height * 0.01,
                      horizontalPadding: 2.0,
                    )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
