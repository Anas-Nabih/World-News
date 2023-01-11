 import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          hintText: "Search",
          filled: true,
          border: buildBorderStyle(),
          contentPadding: EdgeInsets.symmetric(vertical:0.h,horizontal: 3.w)
        ),
      ),
    );
  }

  OutlineInputBorder buildBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none
    );
  }
}