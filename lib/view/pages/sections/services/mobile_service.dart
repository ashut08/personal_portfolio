import 'package:AshuTech/utils/screen_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/service_util.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:AshuTech/view/pages/sections/services/components/service_card.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/gradient_text.dart';

class ServiceMobile extends StatefulWidget {
  const ServiceMobile({super.key});

  @override
  State<ServiceMobile> createState() => _ServiceMobileState();
}

class _ServiceMobileState extends State<ServiceMobile> {
  int currentPos = 0;
  @override
  Widget build(BuildContext context) {
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
        aspectRatio = width / (height); // Make the cards taller
      }

      return aspectRatio;
    }

    double aspectRatio = calculateAspectRatio(width!, height!);

    SizeConfig().init(context);

    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        size10,
        size10,
        Stack(
          alignment: Alignment.bottomCenter,
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
                  "Services",
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
          ],
        ),
        size10,
        size10,
        CarouselSlider.builder(
          itemCount: ServiceUtils.serviceUtils.length,
          options: CarouselOptions(
            initialPage: 1,
            viewportFraction: 0.9,
            aspectRatio: aspectRatio,
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
          itemBuilder: (context, index, i) => ServiceCard(
            isFocus: currentPos == index,
            image: ServiceUtils.serviceUtils[index].serviceImage,
            serviceName: ServiceUtils.serviceUtils[index].serviceName,
            serviceDescription:
                ServiceUtils.serviceUtils[index].serviceDescription,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ServiceUtils.serviceUtils.map((url) {
            int index = ServiceUtils.serviceUtils.indexOf(url);
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
        size10,
        // size10,
        // size10,
        // _buildServiceCard(ServiceUtils.serviceUtils)
      ],
    );
  }

  // Widget _buildServiceCard(List<ServiceModel> serviceModel) {
  //   return LayoutBuilder(
  //     builder: (context, constraints) => ListView.builder(
  //       physics: const NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       itemCount: serviceModel.length,
  //       itemBuilder: (context, i) {
  //         return ServiceCard(
  //           image: serviceModel[i].serviceImage,
  //           serviceName: serviceModel[i].serviceName,
  //           serviceDescription: serviceModel[i].serviceDescription,
  //         );
  //       },
  //     ),
  //   );
  // }
}
