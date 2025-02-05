import 'package:AshuTech/provider/theme_provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:AshuTech/view/pages/main_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../animation/entrancefader.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../../widgets/gradient_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      color: themeProvider.lightTheme ? Colors.white : Colors.black,
      child: Center(
        child: EntranceFader(
          offset: const Offset(-10, 0),
          delay: const Duration(seconds: 1),
          duration: const Duration(milliseconds: 800),
          child: AnimatedTextKit(
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
                'Hi',
                textStyle: GoogleFonts.openSans(
                    fontSize: height * 0.045,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.1),
                cursor: ' | ',
                speed: const Duration(milliseconds: 50),
              ),
              TypewriterAnimatedText(
                'Welocme To My Porfolio',
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
        ),
      ),
    );
  }
}
