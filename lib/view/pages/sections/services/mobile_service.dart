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
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
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
                const CustomDivider(
                  height: 4,
                  width: 33,
                ),
              ],
            ),
            Positioned(
              bottom: 8,
              child: Text(
                "What I Offer",
                style: TextStyle(
                  fontSize: height! * 0.032,
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
            itemCount: ServiceUtils.serviceUtils.length,
            options: CarouselOptions(
                viewportFraction: 0.8,
                aspectRatio: 16 / 14,
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
            itemBuilder: (context, index, i) => ServiceCard(
                  image: ServiceUtils.serviceUtils[index].serviceImage,
                  serviceName: ServiceUtils.serviceUtils[index].serviceName,
                  serviceDescription:
                      ServiceUtils.serviceUtils[index].serviceDescription,
                )),
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
