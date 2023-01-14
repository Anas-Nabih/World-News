
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/widgets/custom_icon.dart';
import 'package:world_news/widgets/custom_text_field.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "World News",
              style: Theme.of(context).textTheme.headline1,
            ),
            CustomIcon(
              onTapped: () {},
              svgPic: "assets/svg/notifications.svg",
            )
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            const Expanded(child: CustomTextField()),
            SizedBox(width: 5.w),
            CustomIcon(onTapped: () {}, svgPic: "assets/svg/filter.svg")
          ],
        )
      ],
    );
  }
}
