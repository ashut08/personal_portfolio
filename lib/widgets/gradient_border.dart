import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class GradientBorderContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double borderWidth;
  final Gradient gradient;
  final Color backgroundColor;
  final double borderRadius;

  const GradientBorderContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderWidth = 3.0,
    required this.gradient,
    this.backgroundColor = Colors.white,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    // Retrieve theme colors from ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      constraints: BoxConstraints(
        minWidth: width ?? MediaQuery.of(context).size.width * 0.2,
        maxWidth: width ?? MediaQuery.of(context).size.width * 0.4,
        minHeight: height ?? 100,
        maxHeight: height ?? 200,
      ),
      decoration: BoxDecoration(
          color: themeProvider.lightTheme ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(60),
          border: Border.all(
              width: 3, style: BorderStyle.solid, color: Colors.deepPurple)),
      child: child,
    );
  }
}
