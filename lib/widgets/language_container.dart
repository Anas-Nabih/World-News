import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/theme/app_provider.dart';

class LanguageContainer extends StatelessWidget {
  const LanguageContainer(
      {required this.containerBG,
      required this.onTapped,
      required this.textColor,
      required this.title,
      Key? key})
      : super(key: key);
  final String title;
  final Color containerBG;
  final Color textColor;
  final Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        width: 30.w,
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(boxShadow: [
          appProvider.darkTheme
              ? BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(2, 2), // changes position of shadow
                )
              : BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(1, 3), // changes position of shadow
                ),
        ], color: containerBG, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
