import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:personal_portfolio/animation/entrancefader.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/screen_helper.dart';
import 'package:personal_portfolio/view/pages/home_page.dart';
import 'package:personal_portfolio/view/pages/main_section.dart';
import 'package:personal_portfolio/view/pages/sections/about/aboutme.dart';
import 'package:personal_portfolio/view/pages/sections/contacts/contact.dart';
import 'package:personal_portfolio/view/pages/sections/projects/projects.dart';
import 'package:personal_portfolio/view/pages/sections/services/service.dart';
import 'package:personal_portfolio/widgets/logo.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _scrollController = ScrollController();
  bool isPressed = false;
  bool _isScrollingDown = false;
  void _scroll(int i) {
    _scrollController.animateTo(
      i == 0
          ? 0.0
          : i == 1
              ? MediaQuery.of(context).size.height * 1.05
              : i == 2
                  ? MediaQuery.of(context).size.height * 1.98
                  : i == 3
                      ? MediaQuery.of(context).size.height * 2.9
                      : MediaQuery.of(context).size.height * 4,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return const HomePage();
    } else if (i == 1) {
      return const AboutMe();
    } else if (i == 2) {
      return const MyServices();
    } else if (i == 3) {
      return const MyProject();
    } else if (i == 4) {
      return const ContactMe();
    } else if (i == 5) {
      return Container();
    } else {
      return Container();
    }
  }

  final List<String> _sectionsName = [
    "HOME",
    "ABOUT",
    "SERVICES",
    "PROJECTS",
    "CONTACT"
  ];

  final ThemeProvider _themeProviders = ThemeProvider();
  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.build,
    Icons.article,
    Icons.phone,
  ];
  @override
  @override
  void initState() {
    _scrollController = _themeProviders.controller;
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          _isScrollingDown = true;
          setState(() {});
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollingDown) {
          _isScrollingDown = false;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
        desktop: desktop(), mobile: _mobile(), tablet: desktop());
  }

  _mobile() {
    final themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
      floatingActionButton: const Icon(Icons.arrow_downward_rounded),
      extendBodyBehindAppBar: true,
      backgroundColor: themeProv.lightTheme ? Colors.white : Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: themeProv.lightTheme ? Colors.black : Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          themeProv.lightTheme ? const LightLogo() : const Logo(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          )
        ],
      ),
      drawer: _appBarMobile(themeProv),
      body: SectionsBody(
        scrollController: _scrollController,
        sectionsLength: _sectionsIcons.length,
        sectionWidget: sectionWidget,
      ),
    );
  }

  desktop() {
    final themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
      floatingActionButton: const Icon(Icons.arrow_downward_rounded),
      appBar: _appBarTabDesktop(themeProv),
      body: SectionsBody(
        scrollController: _scrollController,
        sectionsLength: _sectionsIcons.length,
        sectionWidget: sectionWidget,
      ),
    );
  }

  Widget _appBarActions(
      String childText, int index, IconData icon, ThemeProvider themeProvider) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 250),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 60.0,
              child: MaterialButton(
                hoverColor: kPrimaryColor,
                onPressed: () => _scroll(index),
                child: Text(
                  childText,
                  style: TextStyle(
                    color:
                        themeProvider.lightTheme ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(70),
              onPressed: () {
                _scroll(index);
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  icon,
                  color: kPrimaryColor,
                ),
                title: Text(childText,
                    style: TextStyle(
                      color: themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                    )),
              ),
            ),
          );
  }

  AppBar _appBarTabDesktop(ThemeProvider themeProv) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: themeProv.lightTheme ? Colors.white : Colors.grey[800],
      title: MediaQuery.of(context).size.width < 780
          ? EntranceFader(
              duration: const Duration(milliseconds: 250),
              offset: const Offset(0, -10),
              delay: const Duration(seconds: 3),
              child: themeProv.lightTheme ? const LightLogo() : const Logo(),
            )
          : EntranceFader(
              offset: const Offset(0, -10),
              duration: const Duration(milliseconds: 250),
              delay: const Duration(milliseconds: 100),
              child: themeProv.lightTheme ? const LightLogo() : const Logo(),
            ),
      actions: [
        for (int i = 0; i < _sectionsName.length; i++)
          _appBarActions(_sectionsName[i], i, _sectionsIcons[i], themeProv),
        EntranceFader(
          offset: const Offset(0, -10),
          delay: const Duration(milliseconds: 100),
          duration: const Duration(milliseconds: 250),
          child: Container(
            height: 60.0,
            width: 120.0,
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(150),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color: kPrimaryColor)),
              onPressed: () {
                // html.window.open(
                //     'https://drive.google.com/file/d/1FaHIzT9FigDHLx8NlxFIyQfjJTyN9WQ6/view?usp=sharing',
                //     "pdf");
              },
              child: const Text(
                "RESUME",
                // style: GoogleFonts.montserrat(
                //   color: themeProv.lightTheme ? Colors.black : Colors.white,
                //   fontWeight: FontWeight.w300,
                // ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        SizedBox(
          height: 30.0,
          child: Switch(
            inactiveTrackColor: Colors.grey,
            value: !themeProv.lightTheme,
            onChanged: (value) {
              themeProv.lightTheme = !value;
            },
            activeColor: kPrimaryColor,
          ),
        ),
        const SizedBox(width: 15.0),
      ],
    );
  }

  Widget _appBarMobile(ThemeProvider theme) {
    return Drawer(
      child: Material(
        color: theme.lightTheme ? Colors.white : Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: theme.lightTheme ? const LightLogo() : const Logo(),
              ),
              Divider(
                color: theme.lightTheme ? Colors.grey[200] : Colors.white,
              ),
              ListTile(
                leading: const Icon(
                  Icons.light_mode,
                  color: kPrimaryColor,
                ),
                title: Text("Dark Mode",
                    style: TextStyle(
                        color: theme.lightTheme ? Colors.black : Colors.white)),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  value: !theme.lightTheme,
                  onChanged: (value) {
                    theme.lightTheme = !value;
                  },
                  activeColor: kPrimaryColor,
                ),
              ),
              Divider(
                color: theme.lightTheme ? Colors.black : Colors.white,
              ),
              for (int i = 0; i < _sectionsName.length; i++)
                _appBarActions(_sectionsName[i], i, _sectionsIcons[i], theme),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: kPrimaryColor.withAlpha(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: kPrimaryColor)),
                  onPressed: () {
                    //   launchURL(
                    //       "https://drive.google.com/file/d/1FaHIzT9FigDHLx8NlxFIyQfjJTyN9WQ6/view?usp=sharing");
                    // },
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.book,
                      color: Colors.red,
                    ),
                    title: Text(
                      "RESUME",
                      style: TextStyle(
                          color:
                              theme.lightTheme ? Colors.black : Colors.white),
                      // style: GoogleFonts.montserrat(
                      //   fontWeight: FontWeight.w300,
                      //   color: theme.lightTheme ? Colors.black : Colors.white,
                      // ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
