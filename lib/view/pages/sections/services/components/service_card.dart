import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:AshuTech/config/app_dimension.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/colors.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {super.key,
      required this.image,
      this.serviceDescription,
      this.isFocus,
      this.serviceName});
  final String? image;
  final String? serviceName;
  final bool? isFocus;
  final String? serviceDescription;

  @override
  Widget build(BuildContext context) {
    print(isFocus);
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight;
    // var width = SizeConfig.screenWidth;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      height: 350,
      width: 400,
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isFocus == true
            ? [
                BoxShadow(
                    color: const Color(0xffA436FC).withOpacity(0.45),
                    blurRadius: 11,
                    spreadRadius: 3)
              ]
            : [],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: gradientColor,
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            // : const LinearGradient(
            //     colors: [Colors.transparent, Colors.transparent],
            // ,

            child: SvgPicture.asset(
              image!,
              color: kPrimaryColor,
              fit: BoxFit.fill,
              height: 80,
              width: 70,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            serviceName!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            serviceDescription!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          size10,
        ],
      ),
    );
  }
}
  // Container(
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           boxShadow: [
  //             BoxShadow(
  //               color: themeProvider.lightTheme
  //                   ? const Color(0xfffcfcfc)
  //                   : const Color(0xff1b1c1f),
  //               offset: const Offset(0, 2),
  //               spreadRadius: 10,
  //               blurRadius: 1,
  //             ),
  //           ],
  //           // border: Border.all(
  //           //   color: kPrimaryColor.withOpacity(0.5),
  //           // ),
  //         ),
  //         child: SvgPicture.asset(
  //           image!,
  //           color: kSecondryColor,
  //           fit: BoxFit.fill,
  //           height: 35,
  //           width: 35,
  //         ),