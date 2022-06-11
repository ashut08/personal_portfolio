import 'package:flutter/material.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/about_utils.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/sizeconfig.dart';
import 'package:personal_portfolio/view/pages/sections/about/components/about_info_data.dart';
import 'package:personal_portfolio/view/pages/sections/about/components/about_me_header.dart';
import 'package:personal_portfolio/view/pages/sections/about/components/resume_download_button.dart';
import 'package:personal_portfolio/view/pages/sections/about/components/tech_widget.dart';
import 'package:provider/provider.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              //   height: height! / 2.6,
              color: !themeProvider.lightTheme ? Colors.white : Colors.black54,
              child: Container(
                padding: const EdgeInsets.all(6),
                child: Image.network(
                  "https://previews.123rf.com/images/hozard/hozard1809/hozard180900030/108682479-horizontal-headshot-of-young-handsome-european-caucasian-man-pictured-isolated-on-grey-background-we.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AboutMeHeader(),
              const SizedBox(
                height: 10,
              ),
              Text(AboutUtils.aboutMeDetail,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    color:
                        themeProvider.lightTheme ? Colors.black : Colors.white,
                  )),
              // size10,
              Divider(
                height: 15,
                color: themeProvider.lightTheme ? Colors.black : Colors.white,
              ),
              size10,
              const Center(
                child: Text(
                  "Technologies I Have Worked With:",
                  style: TextStyle(color: kPrimaryColor),
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
                information:
                    AboutUtils().ageCalculate(AboutUtils.dob).toString(),
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
            ],
          ))
        ],
      ),
    );
  }
}
