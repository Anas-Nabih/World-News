import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/categories/categories_screen.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({
    required this.prefixText,required this.suffixText,
    Key? key,
  }) : super(key: key);

  final String prefixText,suffixText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(prefixText,style: Theme.of(context).textTheme.subtitle1,),
          GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(
                builder: (context) => const CategoriesScreen(),)),
            child: Text(suffixText,style: TextStyle(
                fontSize: 10.sp,color: MColors.kPrimaryColor
            ),),
          ),

        ],
      ),
    );
  }
}
