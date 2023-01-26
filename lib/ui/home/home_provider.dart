import 'package:flutter/cupertino.dart';
import 'package:world_news/base/provider/base_list_provider.dart';
import 'package:world_news/generated/l10n.dart';

class HomeProvider<T> extends BaseListProvider<T> {
  bool _loadingArticles = false;

  bool get loadingArticles => _loadingArticles;

  set loadingArticles(bool value) {
    _loadingArticles = value;

    notifyListeners();
   }

  String _countryCode = "EG";

  String get countryCode => _countryCode;

  set countryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
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
