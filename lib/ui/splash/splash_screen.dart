import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/ui/main_screen/main_screen.dart';

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
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 4));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/anime/splashAnime.json",
            height: 30.h, controller: _controller, onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(() => Utils.push(
                context: context,
                navigationScreen: const MainScreen(),
                replace: true));
        }),
      ),
    );
  }
}
