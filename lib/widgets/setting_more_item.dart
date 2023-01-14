import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';

class SettingMoreItem extends StatelessWidget {
  const SettingMoreItem({required this.onTapped,required this.svgPic, required this.title, Key? key})
      : super(key: key);

  final String svgPic;
  final String title;
  final Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: GestureDetector(
        onTap: onTapped,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 5.h,
                  width: 5.h,
                  padding: EdgeInsets.all(1.h),
                  decoration: BoxDecoration(
                      color: MColors.kPrimaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6)),
                  child: SvgPicture.asset(
                    svgPic,
                    color: MColors.kPrimaryColor.withOpacity(0.8),
                  ),
                ),
                SizedBox(width: 3.w),
                Text(
                  title,
                  style: TextStyle(fontSize: 13.sp),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            Divider(
              thickness: .2.h,
            ),
          ],
        ),
      ),
    );
  }
}
