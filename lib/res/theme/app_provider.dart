import 'package:flutter/material.dart';
import 'package:world_news/base/provider/base_provider.dart';

class AppProvider extends BaseProvider {
  String _appLocale = "en";

  String get appLocale => _appLocale;

  set appLocale(String value) {
    _appLocale = value;
    debugPrint("app locale statues: $value");
    notifyListeners();
  }

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    debugPrint("theme statues: $value");
    notifyListeners();
  }
}
