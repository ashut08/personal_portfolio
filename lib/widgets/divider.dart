import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.height, this.width});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(colors: gradientColor)),
    );
  }
}
