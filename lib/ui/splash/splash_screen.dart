import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/base/view/base_state.dart';
import 'package:world_news/common_utils/preferences/Prefs.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/splash/splash_presenter.dart';
import 'package:world_news/ui/splash/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends BaseState<SplashScreen, SplashPresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    Prefs.isOnBoardingSkipped
        .then((value) => splashProvider.isOnBoardingSkipped = value);
    Prefs.isCountrySelected
        .then((value) => splashProvider.isCountrySelected = value);
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final SplashProvider splashProvider = SplashProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<SplashProvider>(
        create: (context) => splashProvider,
        child: Consumer<SplashProvider>(
          builder: (context, value, child) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/anime/splashAnime.json",
                    height: 35.h,
                    controller: _controller, onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward().whenComplete(
                        () => mPresenter.handleScreenAfterSplash());
                }),
                Text(
                  "World  News",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: MColors.kPrimaryColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SplashPresenter createPresenter() {
    return SplashPresenter();
  }

  @override
  bool get wantKeepAlive => false;
}
