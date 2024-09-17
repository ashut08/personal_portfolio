import 'package:AshuTech/utils/screen_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:AshuTech/config/app_dimension.dart';
import 'package:AshuTech/config/space.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/project_utils.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/gradient_text.dart';

class ProjectsMobile extends StatefulWidget {
  const ProjectsMobile({super.key});

  @override
  State<ProjectsMobile> createState() => _ProjectsMobileState();
}

class _ProjectsMobileState extends State<ProjectsMobile> {
  int currentPos = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    // var width = SizeConfig.screenWidth;
    final themeProvider = Provider.of<ThemeProvider>(context);
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
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  width: 10,
                ),
                ScreenHelper.isMobile(context)
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
                    style: Theme.of(context).textTheme.headlineMedium,
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
        size10,
        size10,
        CarouselSlider.builder(
          itemCount: ProjectUtils().listOfProject.length,
          options: CarouselOptions(
            initialPage: 1,
            viewportFraction: 0.8,
            autoPlay: true,
            reverse: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(
                () {
                  currentPos = index;
                },
              );
            },
          ),
          itemBuilder: (context, index, i) => Container(
            decoration: BoxDecoration(
              color: themeProvider.lightTheme ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(12),
              boxShadow: currentPos == index
                  ? [
                      BoxShadow(
                          color: const Color(0xffA436FC).withOpacity(0.45),
                          blurRadius: 11,
                          spreadRadius: 3)
                    ]
                  : [],
            ),
            margin: Space.h,
            width: AppDimensions.normalize(150),
            padding: Space.all(),
            height: AppDimensions.normalize(90),
            child: Image.asset(
              ProjectUtils().listOfProject[index].projectImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            ProjectUtils().listOfProject.length,
            (index) => buildDot(index),
          ),
        ),
      ],
    );
  }

  Widget buildDot(int index) {
    final themeProv = Provider.of<ThemeProvider>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: currentPos == index ? 16 : 8,
      decoration: BoxDecoration(
        color: themeProv.lightTheme ? Colors.black : Colors.white,
        gradient: LinearGradient(
          colors: currentPos == index
              ? gradientColor
              : themeProv.lightTheme
                  ? [Colors.black, Colors.black]
                  : [Colors.white, Colors.white],
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
