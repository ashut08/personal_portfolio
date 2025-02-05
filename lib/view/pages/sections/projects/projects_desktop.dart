import 'package:AshuTech/config/space.dart';
import 'package:flutter/material.dart';
import 'package:AshuTech/config/app_dimension.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/project_utils.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:AshuTech/view/pages/sections/projects/components/projects_card.dart';
import 'package:AshuTech/view/pages/sections/projects/components/see_more_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/gradient_text.dart';

class ProjectDesktop extends StatelessWidget {
  const ProjectDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    return Column(
      children: [
        size10,
        size10,
        Row(
          children: [
            const Spacer(),
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
                  "My Work",
                  gradient: primaryGradientColor,
                  style: width! > 1200
                      ? Theme.of(context).textTheme.headlineMedium
                      : Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  width: 10,
                ),
                width < 1200
                    ? const SizedBox()
                    : const CustomDivider(
                        height: 4,
                        width: 33,
                      ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () => launchUrlString("https://github.com/ashut08/"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GradientText(
                    "See More",
                    gradient: primaryGradientColor,
                    style: width > 1200
                        ? Theme.of(context).textTheme.headlineMedium
                        : Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SvgPicture.asset("assets/newicon/arrow.svg"))
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: height! * 0.03,
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
        SizedBox(
          height: height * 0.03,
        ),
      ],
    );
  }
}
