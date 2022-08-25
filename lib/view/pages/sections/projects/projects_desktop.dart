import 'package:flutter/material.dart';
import 'package:AshuTech/config/app_dimension.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/project_utils.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:AshuTech/view/pages/sections/projects/components/projects_card.dart';
import 'package:AshuTech/view/pages/sections/projects/components/see_more_button.dart';
import 'package:provider/provider.dart';

class ProjectDesktop extends StatelessWidget {
  const ProjectDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        size10,
        size10,
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Text(
                "portfolio".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: height! * 0.055,
                  color: themeProvider.lightTheme
                      ? Colors.black.withOpacity(0.2)
                      : Colors.white.withOpacity(0.2),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              child: Text(
                "My Work",
                style: TextStyle(
                  fontSize: height * 0.032,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Wrap(
          spacing: 4,
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: AppDimensions.normalize(10),
          children: ProjectUtils()
              .listOfProject
              .map<Widget>(
                (
                  e,
                ) =>
                    ProjectsCard(data: e),
              )
              .toList(),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        const SeeMore(),
        SizedBox(
          height: height * 0.03,
        ),
      ],
    );
  }
}
