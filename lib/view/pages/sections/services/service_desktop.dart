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
        aspectRatio = 0.8; // Make the cards taller
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
    // Calculate a dynamic viewportFraction based on the screen width and height

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
            height: 20,
          ),
          Center(
            child: Text(
              '''
          
          I craft tailored digital solutions with a blend of technical expertise and creative design. From seamless web and mobile development to engaging UI/UX design, my focus is on delivering results that truly elevate your ideas. Let’s bring your vision to life with precision and innovation.''',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
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
