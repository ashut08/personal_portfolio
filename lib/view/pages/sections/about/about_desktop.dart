import 'package:AshuTech/config/space.dart';
import 'package:AshuTech/widgets/divider.dart';
import 'package:AshuTech/widgets/gradient_text.dart';
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

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final width = SizeConfig.screenWidth;
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: width! * 0.05,
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: height! * 0.6,
              //   height: height! / 2.6,
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
          SizedBox(
            width: width * 0.05,
          ),
          Expanded(
              flex: width < 1230 ? 2 : 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      const SizedBox(
                        width: 10,
                      ),
                      const CustomDivider(
                        height: 4,
                        width: 33,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AboutUtils.aboutMeDetail,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  // size10,
                  Divider(
                    height: 15,
                    color:
                        themeProvider.lightTheme ? Colors.black : Colors.white,
                  ),
                  size10,
                  const Center(
                    child: GradientText(
                      "Technologies I Have Worked With:",
                      gradient: primaryGradientColor,
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
                    color:
                        themeProvider.lightTheme ? Colors.black : Colors.white,
                  ),
                  size10,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AboutMeData(
                        alignment: Alignment.topLeft,
                        data: "Name",
                        information: AboutUtils.name,
                      ),
                      AboutMeData(
                        alignment: Alignment.topLeft,
                        data: "Email",
                        information: AboutUtils.email,
                      ),
                    ],
                  ),
                  size10,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AboutMeData(
                        alignment: Alignment.topLeft,
                        data: "Age",
                        information: AboutUtils()
                            .ageCalculate(AboutUtils.dob)
                            .toString(),
                      ),
                      const AboutMeData(
                        alignment: Alignment.topLeft,
                        data: "Address",
                        information: AboutUtils.addreess,
                      ),
                    ],
                  ),
                  size10,

                  size10,
                  const ResumeDownloadButton()
                ],
              )),
          SizedBox(
            width: width * 0.05,
          ),
        ],
      ),
    );
  }
}
