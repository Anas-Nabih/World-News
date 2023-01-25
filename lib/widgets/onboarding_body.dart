import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/image_loader.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/onboarding/onboarding_provider.dart';
import 'package:world_news/widgets/custom_button.dart';
import 'package:world_news/widgets/custom_slider_indicator.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({Key? key, required this.provider}) : super(key: key);
  final OnBoardingProvider provider;

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageLoader.loadImage(
            "assets/jpg/pic${widget.provider.currentPageIndex}.jpg"),
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
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(TextSpan(
                      text: widget.provider
                              .onBoardingList[widget.provider.currentPageIndex]
                          ["title"],
                      style: TextStyle(color: Colors.white, fontSize: 22.sp),
                      children: [
                        TextSpan(
                            text:
                                " ${widget.provider.onBoardingList[widget.provider.currentPageIndex]["focusText"]}",
                            style: TextStyle(
                                color: MColors.kPrimaryColor, fontSize: 22.sp))
                      ])),
                  CustomSliderIndicator(
                      providerIndex: widget.provider.currentPageIndex),
                  CustomButton(onTapped: () {
                    if (widget.provider.currentPageIndex < 2) {
                      widget.provider.currentPageIndex++;
                    } else {
                      debugPrint(widget.provider.currentPageIndex.toString());
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
