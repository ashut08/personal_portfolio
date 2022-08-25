import 'package:flutter/material.dart';
import 'package:AshuTech/config/app_dimension.dart';
import 'package:AshuTech/config/space.dart';
import 'package:AshuTech/config/ui.dart';

class App {
  static bool? isLtr;
  static bool showAds = false;

  static init(BuildContext context) {
    UI.init(context);
    AppDimensions.init();

    Space.init();

    isLtr = Directionality.of(context) == TextDirection.ltr;
  }
}
