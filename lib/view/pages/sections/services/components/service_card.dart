import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/sizeconfig.dart';
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
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kPrimaryColor,
              width: 4,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                size10,
                Text(
                  serviceName!,
                  style: TextStyle(
                      fontSize: height! * 0.023,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900),
                ),
                size10,
                size10,
                Text(
                  serviceDescription!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: height * 0.015,
                    color:
                        themeProvider.lightTheme ? Colors.black : Colors.white,
                  ),
                ),
                size10,
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(8),
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
            height: 40,
            width: 40,
          ),
        ),
      ],
    );
  }
}
