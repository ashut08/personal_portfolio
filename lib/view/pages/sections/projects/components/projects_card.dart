import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/projects_model.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectsCard extends StatefulWidget {
  ProjectsCard({Key? key, required this.data}) : super(key: key);
  ProjectModel? data;

  @override
  State<ProjectsCard> createState() => _ProjectsCardState();
}

class _ProjectsCardState extends State<ProjectsCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        launchUrlString(widget.data!.link);
      },
      onHover: (value) {
        if (value) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: themeProvider.lightTheme ? Colors.black : Colors.white,
          boxShadow: isHover
              ? [
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 12.0,
                    offset: Offset(0.0, 0.0),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ],
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              children: [
                Text(widget.data!.description),
              ],
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isHover ? 0.0 : 1.0,
              child: Image.asset(
                widget.data!.projectImage,
              ),
            ),
          ],
        ),
      ),
    );
    // SizeConfig().init(context);
    // final themeProvider = Provider.of<ThemeProvider>(context);
    // var height = SizeConfig.screenHeight;
    // var width = SizeConfig.screenWidth;
    // return InkWell(
    //   onTap: () {}vs,
    //   onHover: (value) {
    //     if (value) {
    //       setState(
    //         () {
    //           isHover = true;
    //         },
    //       );
    //     } else {
    //       setState(
    //         () {
    //           isHover = false;
    //         },
    //       );
    //     }
    //   },
    //   child: Container(
    //     // margin: Space.h,
    //     // padding: Space.all(),
    //     // width: AppDimensions.normalize(150),
    //     // height: AppDimensions.normalize(90),
    //     decoration: BoxDecoration(
    //       //    color: themeProvider.lightTheme ? Colors.grey[900] : Colors.white,
    //       borderRadius: BorderRadius.circular(10),
    //       boxShadow: isHover
    //           ? [
    //               const BoxShadow(
    //                 color: Colors.white,
    //                 blurRadius: 12.0,
    //                 offset: Offset(0.0, 0.0),
    //               )
    //             ]
    //           : [
    //               BoxShadow(
    //                 color: Colors.black.withAlpha(100),
    //                 blurRadius: 12.0,
    //                 offset: const Offset(0.0, 0.0),
    //               )
    //             ],
    //     ),
    //     child: Stack(
    //       fit: StackFit.expand,
    //       children: [
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             // Icon(

    //             //   color: AppTheme.c!.primary!,
    //             //   size: height * 0.1,
    //             // )
    //             // (width > 1135 || width < 950)
    //             //     ? SizedBox(
    //             //         height: height * 0.02,
    //             //       )
    //             //     : const SizedBox(),
    //             // (width > 1135 || width < 950)
    //             //     ? Text(
    //             //         widget.projectTitle,
    //             //         style: AppText.b2b,
    //             //         textAlign: TextAlign.center,
    //             //       )
    //             //     : Container(),
    //             // SizedBox(
    //             //   height: height! * 0.01,
    //             // ),
    //             Text(
    //               widget.data!.description,
    //               textAlign: TextAlign.center,
    //             ),
    //             const SizedBox(
    //                 //  height: height! * 0.01,
    //                 ),
    //           ],
    //         ),
    //         AnimatedOpacity(
    //           duration: const Duration(milliseconds: 400),
    //           opacity: isHover ? 0.0 : 1.0,
    //           child: FittedBox(
    //             fit: BoxFit.fill,
    //             child: Image.asset(
    //               widget.data!.projectImage,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
