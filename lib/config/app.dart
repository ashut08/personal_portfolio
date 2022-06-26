import 'package:flutter/material.dart';
import 'package:personal_portfolio/config/app_dimension.dart';
import 'package:personal_portfolio/config/space.dart';
import 'package:personal_portfolio/config/ui.dart';

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
