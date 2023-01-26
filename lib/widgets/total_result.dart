import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TotalResult extends StatelessWidget {
  const TotalResult({Key? key,required this.result}) : super(key: key);

  final int result;

  @override
  Widget build(BuildContext context) {
    return Text("Total Result: $result",style: TextStyle(
        fontSize: 12.sp
    ),);
  }
}
