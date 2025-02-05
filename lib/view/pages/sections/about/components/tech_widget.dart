import 'package:flutter/material.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:provider/provider.dart';

class ToolTechWidget extends StatelessWidget {
  final String techName;

  const ToolTechWidget({super.key, required this.techName});
  @override
  Widget build(BuildContext context) {
    final themProv = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        const Icon(
          Icons.play_arrow,
          color: kPrimaryColor,
          // color: AppTheme.c!.primary,
          // size: AppDimensions.normalize(6),
        ),
        Text(
          techName,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: themProv.lightTheme ? Colors.black : Colors.white),
        ),
      ],
    );
  }
}
