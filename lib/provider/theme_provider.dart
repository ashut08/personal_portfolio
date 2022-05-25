import 'package:flutter/cupertino.dart';
import 'package:personal_portfolio/utils/preference_helper.dart';

class ThemeProvider extends ChangeNotifier {
  PreferenceHelper darkThemePref = PreferenceHelper();
  bool _lightTheme = false;
  bool get lightTheme => _lightTheme;
  ScrollController scrollController = ScrollController();

  ScrollController get controller => scrollController;

  set scroll(int i) {
    scrollController.animateTo(
      i == 0 ? 100 : 0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  set lightTheme(bool value) {
    _lightTheme = value;
    darkThemePref.setDarkTheme(value);

    notifyListeners();
  }
}
