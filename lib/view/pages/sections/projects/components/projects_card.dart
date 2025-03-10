import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:AshuTech/animation/flip_card.dart';
import 'package:AshuTech/config/app_dimension.dart';
import 'package:AshuTech/config/space.dart';
import 'package:AshuTech/config/ui.dart';
import 'package:AshuTech/models/projects_model.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../animation/flip_card_controller.dart';

// ignore: must_be_immutable
class ProjectsCard extends StatefulWidget {
  ProjectsCard({super.key, required this.data});
  ProjectModel? data;

  @override
  State<ProjectsCard> createState() => _ProjectsCardState();
}

class _ProjectsCardState extends State<ProjectsCard> {
  bool isHover = false;
  FlipCardController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
    super.initState();
  }

  // @override
  // void dispose() {
  //   _controller!.controller!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    SizeConfig().init(context);
    AppDimensions.init();
    UI.init(context);

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        launchUrlString(widget.data!.link);
      },
      onHover: (value) {
        if (value) {
          _controller!.toggleCard();
        } else {
          _controller!.toggleCard();
        }

        // if (value) {
        //   setState(() {
        //     isHover = true;
        //     _controller!.toggleCard();
        //     // _controller!.hint(
        //     //   duration: const Duration(milliseconds: 500),
        //     //   total: const Duration(milliseconds: 500),
        //     // );
        //   });
        // } else {

        //   setState(() {
        //     isHover = false;
        //   });
        // }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DottedBorder(
          color: kPrimaryColor,
          dashPattern: const [4, 4],
          strokeWidth: 2,
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: AppDimensions.normalize(150),
            padding: Space.all(),
            height: AppDimensions.normalize(90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: !themeProvider.lightTheme ? Colors.black : Colors.white,
              boxShadow: isHover
                  ? [
                      const BoxShadow(
                        color: kPrimaryColor,
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
            child: FlipCard(
              controller: _controller,
              side: CardSide.FRONT,
              onFlip: () {
                setState(() {
                  // isHover = true;
                });
              },
              flipOnTouch: false,
              front: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: isHover ? 0.0 : 1.0,
                child: Image.asset(
                  widget.data!.projectImage,
                  fit: BoxFit.cover,
                ),
              ),
              back: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  size10,
                  Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            widget.data!.projectIcon,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color:
                        !themeProvider.lightTheme ? Colors.black : Colors.white,
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      widget.data!.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
