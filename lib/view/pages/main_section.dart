import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:AshuTech/widgets/social_icons.dart';
import 'package:flutter/material.dart';

class SectionsBody extends StatelessWidget {
  final ScrollController scrollController;
  final int sectionsLength;
  final Widget Function(int) sectionWidget;

  const SectionsBody({
    super.key,
    required this.scrollController,
    required this.sectionsLength,
    required this.sectionWidget,
  });
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var height = SizeConfig.screenHeight!;
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              // padding: const EdgeInsets.all(20),
              // physics: !kIsWeb ? ScrollPhysics() : NeverScrollableScrollPhysics(),
              controller: scrollController,
              shrinkWrap: true,
              itemCount: sectionsLength,
              itemBuilder: (context, index) {
                print(index);
                return sectionWidget(index);
              }),
        ),
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       for (int i = 0; i < kSocialIcons.length; i++)
        //         SocialMediaIcon(
        //           icon: kSocialIcons[i],
        //           socialLink: kSocialLinks[i],
        //           height: height * 0.03,
        //           horizontalPadding: 2.0,
        //         )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
