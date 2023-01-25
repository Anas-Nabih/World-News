import 'package:world_news/base/provider/base_provider.dart';

class OnBoardingProvider extends BaseProvider{
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  set currentPageIndex(int value) {
    _currentPageIndex = value;
    notifyListeners();
  }

  List<Map<String, String>> onBoardingList = [
    {
      "title":"Get the latest news from",
      "focusText":"reliable resource",
      "img":"assets/jpg/pic1.jpg"
    },{
      "title":"Get actual news from",
      "focusText":"around the world",
      "img":"assets/jpg/pic2.jpg"
    },{
      "title":"Sports, politics, healthy,",
      "focusText":"& anything",
      "img":"assets/jpg/pic3.jpg"
    },
  ];
}