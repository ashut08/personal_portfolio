import 'package:AshuTech/utils/blog_constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:AshuTech/view/pages/sections/blogs/components/blog_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/screen_helper.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/gradient_text.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<ThemeProvider>(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;

    // Calculate a responsive aspect ratio based on screen width and height
    double calculateAspectRatio(double width, double height) {
      double aspectRatio = 0.0;

      if (width > 1200) {
        // For large screens, use a smaller aspect ratio to make the cards wider
        aspectRatio = width /
            (height *
                0.6); // You can tweak the 1.2 multiplier to adjust the aspect ratio
      } else if (width > 800) {
        // For medium screens, use a moderate aspect ratio
        aspectRatio =
            width / (height * 0.9); // Adjust as needed to maintain balance
      } else {
        // For small screens, use a taller aspect ratio
        aspectRatio = 0.7; // Make the cards taller
      }

      return aspectRatio;
    }

    double aspectRatio = calculateAspectRatio(width!, height!);

    // Adjust viewport fraction to ensure responsive card width
    double calculateViewportFraction(double width) {
      if (width > 1200) {
        return 0.4; // For large screens, show more of the card
      } else if (width > 800) {
        return 0.6; // For medium screens, show moderate portion
      } else {
        return 0.9; // For smaller screens, show most of the card
      }
    }

    double viewportFraction = calculateViewportFraction(width);

    return Column(
      children: [
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
                  "Blogs",
                  gradient: primaryGradientColor,
                  style: width > 1200
                      ? Theme.of(context).textTheme.headlineMedium
                      : Theme.of(context).textTheme.titleLarge,
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
              onTap: () =>
                  launchUrlString("https://medium.com/@ashuflutterdev"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GradientText(
                    "Read More",
                    gradient: primaryGradientColor,
                    style: width > 1200
                        ? Theme.of(context).textTheme.headlineMedium
                        : Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SvgPicture.asset("assets/newicon/arrow.svg"),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        CarouselSlider.builder(
          itemCount: kblogList.length,
          options: CarouselOptions(
            initialPage: 1,
            viewportFraction: viewportFraction,
            autoPlay: true,
            aspectRatio: aspectRatio,
            reverse: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          itemBuilder: (context, index, i) {
            return BLogCard(
              isFocus: currentPage == index,
              item: kblogList[index],
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            kblogList.length,
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
      width: currentPage == index ? 16 : 8,
      decoration: BoxDecoration(
        color: themeProv.lightTheme ? Colors.black : Colors.white,
        gradient: LinearGradient(
          colors: currentPage == index
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
