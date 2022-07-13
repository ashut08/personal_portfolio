import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/screen_helper.dart';
import 'package:personal_portfolio/view/pages/sections/home/home_desktop.dart';
import 'package:personal_portfolio/view/pages/sections/home/home_desktops.dart';
import 'package:personal_portfolio/view/pages/sections/home/home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ScreenHelper(
      desktop: HomeDesktop(),
      mobile: HomeMobile(),
      tablet: HomeTab(),
    );
  }
}
