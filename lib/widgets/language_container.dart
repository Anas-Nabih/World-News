import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LanguageContainer extends StatelessWidget {
  const LanguageContainer({required this.onTapped,required this.title, Key? key}) : super(key: key);
  final String title;
  final Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        width: 30.w,
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(1, 3), // changes position of shadow
              )
            ],
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}