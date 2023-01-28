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

  List<Map<String, String>> categoriesList({required BuildContext context}) {
    return [
      {
        "title": S.of(context).general,
        "key": "General",
        "img":
            "https://firebasestorage.googleapis.com/v0/b/world-news-eb2d5.appspot.com/o/General.jpg?alt=media&token=f81c63f8-b5e2-4c80-80ae-7d495b6138d5"
      },
      {
        "title": S.of(context).technology,
        "key": "Technology",
        "img":
            "https://firebasestorage.googleapis.com/v0/b/world-news-eb2d5.appspot.com/o/technology.jpg?alt=media&token=b910aca4-9b7b-49e6-926a-c72c371d0dfe"
      },
      {
        "title": S.of(context).business,
        "key": "Business",
        "img":
            "https://firebasestorage.googleapis.com/v0/b/world-news-eb2d5.appspot.com/o/Business.jpg?alt=media&token=7ce2fe2f-b0af-45b1-ab52-dab8388d65c0"
      },
      {
        "title": S.of(context).science,
        "key": "Science",
        "img":
            "https://firebasestorage.googleapis.com/v0/b/world-news-eb2d5.appspot.com/o/science.jpg?alt=media&token=33966f38-c13b-4974-b102-ccf68af0c9bc"
      },
      {
        "title": S.of(context).sports,
        "key": "Sports",
        "img":
            "https://firebasestorage.googleapis.com/v0/b/world-news-eb2d5.appspot.com/o/Sports.jpg?alt=media&token=77689582-ed98-4830-b154-abd4c536649d"
      },
      {
        "title": S.of(context).health,
        "key": "Health",
        "img":
            "https://firebasestorage.googleapis.com/v0/b/world-news-eb2d5.appspot.com/o/health.jpg?alt=media&token=f2762ccd-c254-40db-b31e-512254cae6f7"
      },
      {
        "title": S.of(context).entertainment,
        "key": "Entertainment",
        "img":
            "https://firebasestorage.googleapis.com/v0/b/world-news-eb2d5.appspot.com/o/entertainment.jpg?alt=media&token=1bf70bd9-d196-4673-a3d8-b53995fe72ad"
      },
    ];
  }
}
