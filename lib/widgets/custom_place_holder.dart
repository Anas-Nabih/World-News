import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';

class CustomPlaceHolder extends StatelessWidget {
  const CustomPlaceHolder({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Lottie.asset("assets/anime/World.json"),
          Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 14.sp, color: MColors.kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
