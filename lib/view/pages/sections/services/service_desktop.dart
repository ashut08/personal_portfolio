import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:AshuTech/models/service_model.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/service_util.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:AshuTech/view/pages/sections/services/components/service_card.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/gradient_text.dart';

class ServiceDesktop extends StatefulWidget {
  const ServiceDesktop({super.key});

  @override
  State<ServiceDesktop> createState() => _ServiceDesktopState();
}

class _ServiceDesktopState extends State<ServiceDesktop> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;

    double calculateAspectRatio(double width, double height) {
      double targetHeight = 200;
      return width / targetHeight;
    }

    double calculateViewportFraction(double width, double height) {
      // Calculate aspect ratio
      double aspectRatio = width / height;

      // Adjust viewportFraction based on the aspect ratio or desired number of items
      // For example, the higher the aspect ratio (wider screen), the larger the viewportFraction
      if (aspectRatio > 1.8) {
        return 0.8; // Less space between items for wider screens
      } else if (aspectRatio > 1.5) {
        return 0.85; // Moderate space between items
      } else {
        return 0.35; // More space between items for taller screens
      }
    }

    // Calculate a dynamic viewportFraction based on the screen width and height
    double viewportFraction = calculateViewportFraction(height!, width!);
    double aspectRatio = calculateAspectRatio(height, width);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the content inside the row
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomDivider(
                height: 4,
                width: 33,
              ),
              const SizedBox(
                width: 10,
              ),
              GradientText(
                "My Services",
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
            height: 30,
          ),
          CarouselSlider.builder(
            itemCount: ServiceUtils.serviceUtils.length,
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
                setState(
                  () {
                    currentPage = index;
                    print(currentPage);
                  },
                );
              },
            ),
            itemBuilder: (context, index, i) => ServiceCard(
              isFocus: currentPage == index,
              image: ServiceUtils.serviceUtils[index].serviceImage,
              serviceName: ServiceUtils.serviceUtils[index].serviceName,
              serviceDescription:
                  ServiceUtils.serviceUtils[index].serviceDescription,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              ServiceUtils.serviceUtils.length,
              (index) => buildDot(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: currentPage == index ? 16 : 8,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          colors: currentPage == index
              ? gradientColor
              : [Colors.white, Colors.white],
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
