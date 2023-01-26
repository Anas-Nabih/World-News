import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/common_utils/image_loader.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/preferences/Prefs.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/onboarding/onboarding_provider.dart';
import 'package:world_news/ui/select_country/countries_screen.dart';
import 'package:world_news/widgets/custom_button.dart';
import 'package:world_news/widgets/custom_slider_indicator.dart';
import 'package:world_news/widgets/onboarding_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OnBoardingProvider provider = OnBoardingProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnBoardingProvider>(
      create: (context) => provider,
      child: Consumer<OnBoardingProvider>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: [
              ImageLoader.loadImage(
                  "assets/jpg/pic${provider.currentPageIndex}.jpg"),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  height: 40.h,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black87],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OnBoardingText(
                            text: "${provider.onBoardingList[provider.currentPageIndex]["title"]}",
                            focusText:
                                " ${provider.onBoardingList[provider.currentPageIndex]["focusText"]}"),
                        CustomSliderIndicator(
                            providerIndex: provider.currentPageIndex),
                        CustomButton(onTapped: ()=> onCustomButtonTapped()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onCustomButtonTapped(){
    if (provider.currentPageIndex < 2) {
      provider.currentPageIndex++;
    } else {
      Prefs.setIsOnBoardingSkipped(true);
      Utils.push(context: context, navigationScreen: const CountriesScreen(),replace: true);
    }
  }
}
