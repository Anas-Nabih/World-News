import 'package:world_news/base/provider/base_provider.dart';

class SplashProvider extends BaseProvider{

  bool _isCountrySelected = false;

  bool get isCountrySelected => _isCountrySelected;

  set isCountrySelected(bool value) {
    _isCountrySelected = value;
    notifyListeners();
  }

  bool _isOnBoardingSkipped = false;

  bool get isOnBoardingSkipped => _isOnBoardingSkipped;

  set isOnBoardingSkipped(bool value) {
    _isOnBoardingSkipped = value;
    notifyListeners();
  }
}