import 'package:flutter/material.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/about_utils.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:AshuTech/view/pages/sections/about/components/about_info_data.dart';
import 'package:AshuTech/view/pages/sections/about/components/resume_download_button.dart';
import 'package:AshuTech/view/pages/sections/about/components/tech_widget.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/gradient_text.dart';

class AboutMoile extends StatelessWidget {
  const AboutMoile({super.key});

  @override
  Widget build(BuildContext context) {
    //(AboutUtils().ageCalculate(AboutUtils.dob).toString());

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
            child: Container(
              height: height * 0.6,
              padding: const EdgeInsets.all(6),
              child: Image.asset(
                "assets/dpimage/profile2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        size10,
        Row(
          children: [
            const CustomDivider(
              height: 4,
              width: 33,
            ),
            const SizedBox(
              width: 10,
            ),
            GradientText(
              "About Me",
              gradient: primaryGradientColor,
              style: Theme.of(context).textTheme.displaySmall,
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
        Wrap(
          alignment: WrapAlignment.center,
          verticalDirection: VerticalDirection.up,
          // alignment: WrapAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
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
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AboutMeData(
              width: double.infinity,
              alignment: Alignment.center,
              data: "Name",
              information: AboutUtils.name,
            ),
            SizedBox(
              height: 10,
            ),
            AboutMeData(
              width: double.infinity,
              alignment: Alignment.center,
              data: "Email",
              information: AboutUtils.email,
            ),
          ],
        ),
        size10,
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AboutMeData(
              width: double.infinity,
              alignment: Alignment.center,
              data: "Age",
              information: AboutUtils().ageCalculate(AboutUtils.dob).toString(),
            ),
            const SizedBox(
              height: 10,
            ),
            const AboutMeData(
              width: double.infinity,
              alignment: Alignment.center,
              data: "Address",
              information: AboutUtils.addreess,
            ),
          ],
        ),
        size10,
        size10,
        const ResumeDownloadButton()
      ]),
    );
  }
}
