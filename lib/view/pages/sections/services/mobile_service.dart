import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/service_model.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/service_util.dart';
import 'package:personal_portfolio/utils/sizeconfig.dart';
import 'package:personal_portfolio/view/pages/sections/services/components/service_card.dart';
import 'package:provider/provider.dart';

class ServiceMobile extends StatefulWidget {
  const ServiceMobile({Key? key}) : super(key: key);

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
            Center(
              child: Text(
                "Services".toUpperCase(),
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
                "What I Offer",
                style: TextStyle(
                  fontSize: height * 0.032,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        CarouselSlider.builder(
            itemCount: ServiceUtils.serviceUtils.length,
            options: CarouselOptions(
                viewportFraction: 0.7,
                aspectRatio: 3 / 2.2,
                autoPlay: true,
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

  Widget _buildServiceCard(List<ServiceModel> serviceModel) {
    return LayoutBuilder(
      builder: (context, constraints) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: serviceModel.length,
        itemBuilder: (context, i) {
          return ServiceCard(
            image: serviceModel[i].serviceImage,
            serviceName: serviceModel[i].serviceName,
            serviceDescription: serviceModel[i].serviceDescription,
          );
        },
      ),
    );
  }
}
