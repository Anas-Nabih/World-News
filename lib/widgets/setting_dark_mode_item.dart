import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:sizer/sizer.dart';

class SettingDarkModeItem extends StatelessWidget {
  const SettingDarkModeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Column(
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
                "assets/svg/dark_mode.svg",
                color: MColors.kPrimaryColor.withOpacity(0.8),
              ),
            ),
            SizedBox(width: 3.w),
            Text(
              "Dark Mode",
              style: TextStyle(fontSize: 13.sp),
            ),
            const Spacer(),
            CupertinoSwitch(
                activeColor: MColors.kPrimaryColor,
                value: appProvider.darkTheme,
                onChanged: (val) {
                  appProvider.darkTheme = val;
                })
          ],
        ),
        Divider(
          thickness: .2.h,
        ),
      ],
    );
  }
}
