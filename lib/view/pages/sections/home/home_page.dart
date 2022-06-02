import 'package:flutter/material.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/screen_helper.dart';
import 'package:personal_portfolio/utils/sizeconfig.dart';
import 'package:personal_portfolio/view/pages/sections/home/components/aboutText.dart';
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
    return ScreenHelper.isMobile(context)
        ? mobileView(height, width, themeProvider)
        : desktopView(height, width, themeProvider);
  }

  Stack mobileView(double? height, double? width, ThemeProvider themeProvider) {
    return Stack(
      children: [
        ///background image
        ///
        Container(
          color: themeProvider.lightTheme ? Colors.white : Colors.black,
          child: Image.network(
            "https://previews.123rf.com/images/hozard/hozard1809/hozard180900030/108682479-horizontal-headshot-of-young-handsome-european-caucasian-man-pictured-isolated-on-grey-background-we.jpg",
            height: height,
            fit: BoxFit.cover,
            width: width,
          ),
        ),

        ///about section start here
        aboutSectionWidget(height, themeProvider)
      ],
    );
  }

  Widget desktopView(
      double? height, double? width, ThemeProvider themeProvider) {
    return Row(
      children: [
        Expanded(child: aboutSectionWidget(height, themeProvider)),
        Expanded(
          flex: 1,
          child: Container(
            color: themeProvider.lightTheme ? Colors.white : Colors.black,
            child: Image.network(
              "https://previews.123rf.com/images/hozard/hozard1809/hozard180900030/108682479-horizontal-headshot-of-young-handsome-european-caucasian-man-pictured-isolated-on-grey-background-we.jpg",
              height: height,
              fit: BoxFit.fill,
              width: width,
            ),
          ),
        ),
      ],
    );
  }

  Widget aboutMe(ThemeProvider themeProvider) {
    return Container(
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: Row(children: const [Text("About Me")]),
    );
  }
}
