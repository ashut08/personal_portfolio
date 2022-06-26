import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/project_utils.dart';
import 'package:personal_portfolio/utils/sizeconfig.dart';
import 'package:personal_portfolio/view/pages/sections/projects/components/projects_card.dart';
import 'package:provider/provider.dart';

class ProjectsMobile extends StatefulWidget {
  const ProjectsMobile({Key? key}) : super(key: key);

  @override
  State<ProjectsMobile> createState() => _ProjectsMobileState();
}

class _ProjectsMobileState extends State<ProjectsMobile> {
  int currentPos = 0;
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
        size10,
        size10,
        CarouselSlider.builder(
            itemCount: ProjectUtils().listOfProject.length,
            options: CarouselOptions(
                viewportFraction: 0.8,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;
                  });
                }),
            itemBuilder: (context, index, i) =>
                ProjectsCard(data: ProjectUtils().listOfProject[index])),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ProjectUtils().listOfProject.map((data) {
            int index = ProjectUtils().listOfProject.indexOf(data);
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPos == index
                    ? kPrimaryColor
                    : themeProvider.lightTheme
                        ? Colors.black
                        : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
