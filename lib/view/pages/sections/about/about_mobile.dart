import 'package:flutter/material.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/about_utils.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:AshuTech/view/pages/sections/about/components/about_info_data.dart';
import 'package:AshuTech/view/pages/sections/about/components/resume_download_button.dart';
import 'package:AshuTech/view/pages/sections/about/components/tech_widget.dart';
import 'package:provider/provider.dart';

class AboutMoile extends StatelessWidget {
  const AboutMoile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(AboutUtils().ageCalculate(AboutUtils.dob).toString());

    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Container(
            height: height! * 0.6,
            width: width! / 1.3,
            //   margin: const EdgeInsets.all(10),
            color: !themeProvider.lightTheme ? Colors.white : Colors.black54,
            child: Container(
              height: height * 0.6,
              padding: const EdgeInsets.all(6),
              child: Image.asset(
                "assets/dpimage/image.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        size10,
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Text(
                "about me".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: height * 0.055,
                  color: themeProvider.lightTheme
                      ? Colors.black.withOpacity(0.2)
                      : Colors.white.withOpacity(0.2),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              child: Text(
                "I'm Ashutosh Singh",
                style: TextStyle(
                  fontSize: height * 0.026,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(AboutUtils.aboutMeDetail,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 18,
              color: themeProvider.lightTheme ? Colors.black : Colors.white,
            )),
        size10,
        Divider(
          height: 10,
          color: themeProvider.lightTheme ? Colors.black : Colors.white,
        ),
        const Center(
          child: Text(
            "Technologies I Have Worked With:",
            style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        size10,
        Row(
          // alignment: WrapAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: kTools
              .map(
                (e) => ToolTechWidget(techName: e),
              )
              .toList(),
        ),
        size10,
        Divider(
          color: themeProvider.lightTheme ? Colors.black : Colors.white,
        ),
        size10,
        const AboutMeData(
          alignment: Alignment.topLeft,
          data: "Name",
          information: AboutUtils.name,
        ),
        size10,
        const AboutMeData(
          alignment: Alignment.topLeft,
          data: "Email",
          information: AboutUtils.email,
        ),
        size10,
        AboutMeData(
          alignment: Alignment.topLeft,
          data: "Age",
          information: AboutUtils().ageCalculate(AboutUtils.dob).toString(),
        ),
        size10,
        const AboutMeData(
          alignment: Alignment.topLeft,
          data: "Address",
          information: AboutUtils.addreess,
        ),
        size10,
        size10,
        const ResumeDownloadButton()
      ]),
    );
  }
}
