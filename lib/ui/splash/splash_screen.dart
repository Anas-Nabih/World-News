import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/main_screen/main_screen.dart';
import 'package:world_news/ui/splash/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SplashProvider splashProvider = SplashProvider();
    return Scaffold(
      body: ChangeNotifierProvider<SplashProvider>(
        create: (context) => splashProvider,
        child: Consumer<SplashProvider>(builder: (context, value, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/anime/splashAnime.json",
                  height: 35.h, controller: _controller, onLoaded: (composition) {
                    _controller
                      ..duration = composition.duration
                      ..forward().whenComplete(() => Utils.push(
                          context: context,
                          navigationScreen: const MainScreen(),
                          replace: true));
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
        ),),
      ),
    );
  }

  pageAfterSplash(){

  }
}
