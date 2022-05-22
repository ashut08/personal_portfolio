import 'package:flutter/cupertino.dart';
import 'package:personal_portfolio/utils/preference_helper.dart';

class ThemeProvider extends ChangeNotifier {
  PreferenceHelper darkThemePref = PreferenceHelper();
  bool _lightTheme = false;
  bool get lightTheme => _lightTheme;

  set lightTheme(bool value) {
    _lightTheme = value;
    darkThemePref.setDarkTheme(value);

    notifyListeners();
  }
}
