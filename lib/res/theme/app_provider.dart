import 'package:flutter/material.dart';
import 'package:world_news/base/provider/base_provider.dart';
import 'package:world_news/generated/l10n.dart';

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
    notifyListeners();
  }

  List<String> categoriesList({required BuildContext context}){
    return  [

      S.of(context).general,
      S.of(context).technology,
      S.of(context).business,
      S.of(context).science,
      S.of(context).sports,
      S.of(context).health,
      S.of(context).entertainment,
    ];
  }
}
