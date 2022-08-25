import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:AshuTech/config/app_dimension.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:provider/provider.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {Key? key,
      required this.image,
      this.serviceDescription,
      this.serviceName})
      : super(key: key);
  final String? image;
  final String? serviceName;
  final String? serviceDescription;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: AppDimensions.normalize(100),
          height: AppDimensions.normalize(180),
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kPrimaryColor,
              width: 4,
            ),
          ),
          child: Column(
            children: [
              size10,
              size10,
              Text(
                serviceName!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: height! * 0.028,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w900),
              ),
              size10,
              size10,
              Text(
                serviceDescription!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: height * 0.020,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: themeProvider.lightTheme ? Colors.black : Colors.white,
                ),
              ),
              size10,
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: themeProvider.lightTheme
                    ? const Color(0xfffcfcfc)
                    : const Color(0xff1b1c1f),
                offset: const Offset(0, 2),
                spreadRadius: 10,
                blurRadius: 1,
              ),
            ],
            // border: Border.all(
            //   color: kPrimaryColor.withOpacity(0.5),
            // ),
          ),
          child: SvgPicture.asset(
            image!,
            color: kSecondryColor,
            fit: BoxFit.fill,
            height: 35,
            width: 35,
          ),
        ),
      ],
    );
  }
}
