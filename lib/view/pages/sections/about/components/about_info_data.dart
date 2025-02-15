import 'package:AshuTech/utils/colors.dart';
import 'package:AshuTech/widgets/gradient_border.dart';
import 'package:AshuTech/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class AboutMeData extends StatelessWidget {
  final String data;
  final String information;
  final Alignment? alignment;
  final double? width;

  const AboutMeData({
    super.key,
    this.width,
    required this.data,
    required this.information,
    this.alignment,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: GradientBorderContainer(
        width: width,
        height: 90,
        gradient: primaryGradientColor,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            GradientText(
              data,
              gradient: primaryGradientColor,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              information,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
