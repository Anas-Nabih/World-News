import 'package:flutter/material.dart';
import 'package:world_news/widgets/custom_icon.dart';
import 'package:sizer/sizer.dart';

class NewsDetailsAppBar extends StatelessWidget {
  const NewsDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        const Spacer(),
        const CustomIcon(svgPic: "assets/svg/share.svg"),
        SizedBox(width: 2.w),
        const CustomIcon(svgPic: "assets/svg/link.svg"),
        SizedBox(width: 2.w),
        const CustomIcon(svgPic: "assets/svg/bookmark.svg"),
        SizedBox(width: 2.w),
        const CustomIcon(svgPic: "assets/svg/menu.svg"),
      ],
    );
  }
}
