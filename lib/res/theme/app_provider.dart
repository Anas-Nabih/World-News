import 'package:flutter/material.dart';
import 'package:world_news/base/provider/base_provider.dart';

class AppProvider extends BaseProvider {
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    debugPrint("theme statues: $value");
    notifyListeners();
  }
}
