import 'package:world_news/base/provider/base_provider.dart';

class CountriesProvider extends BaseProvider{

  int _countryIndex = -1;

  int get countryIndex => _countryIndex;

  set countryIndex(int value) {
    _countryIndex = value;
    notifyListeners();
  }

  String _countryCode= "EG";

  String get countryCode => _countryCode;

  set countryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  List<Map<String,String>> countries = [
    {
      "code":"AE",
      "countryEN":"United Arab Emirates",
      "countryAR":"الإمارات العربية المتحدة",
    },{
      "code":"EG",
      "countryEN":"Egypt",
      "countryAR":"مصر",
    },{
      "code":"US",
      "countryEN":"United States of America",
      "countryAR":"الولايات المتحدة الأمريكية",
    },{
      "code":"AR",
      "countryEN":"Argentina",
      "countryAR":"Argentina",
    },{
      "code":"AT",
      "countryEN":"Austria",
      "countryAR":"Argentina",
    },{
      "code":"AU",
      "countryEN":"Australia",
      "countryAR":"Argentina",
    },{
      "code":"BE",
      "countryEN":"Belgium",
      "countryAR":"Argentina",
    },{
      "code":"BR",
      "countryEN":"Brazil",
      "countryAR":"Argentina",
    },{
      "code":"CA",
      "countryEN":"Canada",
      "countryAR":"Argentina",
    },{
      "code":"CH",
      "countryEN":"Switzerland",
      "countryAR":"Argentina",
    },{
      "code":"CN",
      "countryEN":"China",
      "countryAR":"Argentina",
    },{
      "code":"CO",
      "countryEN":"Colombia",
      "countryAR":"Argentina",
    },{
      "code":"CU",
      "countryEN":"Cuba",
      "countryAR":"Argentina",
    },{
      "code":"DE",
      "countryEN":"Germany",
      "countryAR":"Argentina",
    },{
      "code":"GB",
      "countryEN":"United Kingdom",
      "countryAR":"Argentina",
    },{
      "code":"GR",
      "countryEN":"Greece",
      "countryAR":"Argentina",
    },{
      "code":"HK",
      "countryEN":"Hong Kong",
      "countryAR":"Argentina",
    },{
      "code":"MA",
      "countryEN":"Morocco",
      "countryAR":"Argentina",
    },{
      "code":"MX",
      "countryEN":"Mexico",
      "countryAR":"Argentina",
    },{
      "code":"SA",
      "countryEN":"	Saudi Arabia",
      "countryAR":"Argentina",
    },{
      "code":"SE",
      "countryEN":"Sweden",
      "countryAR":"Argentina",
    },{
      "code":"ZA",
      "countryEN":"South Africa",
      "countryAR":"Argentina",
    }
  ];
}