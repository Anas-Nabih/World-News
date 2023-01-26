import 'package:world_news/base/presenter/base_presenter.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/ui/main_screen/main_screen.dart';
import 'package:world_news/ui/onboarding/onboarding_screen.dart';
import 'package:world_news/ui/select_country/countries_screen.dart';
import 'package:world_news/ui/splash/splash_screen.dart';

class SplashPresenter extends BasePresenter<SplashScreenState> {
  handleScreenAfterSplash() {
    if (view.splashProvider.isOnBoardingSkipped == true &&
        view.splashProvider.isCountrySelected == true) {
      Utils.push(
          context: view.getContext(),
          navigationScreen: const MainScreen(),
          replace: true);
    } else if (view.splashProvider.isOnBoardingSkipped == false &&
        view.splashProvider.isCountrySelected == false) {
      Utils.push(
          context: view.getContext(),
          navigationScreen: const OnBoardingScreen(),
          replace: true);
    } else if (view.splashProvider.isOnBoardingSkipped == true &&
        view.splashProvider.isCountrySelected == false) {
      Utils.push(
          context: view.getContext(),
          navigationScreen: const CountriesScreen(),
          replace: true);
    }
  }
}
