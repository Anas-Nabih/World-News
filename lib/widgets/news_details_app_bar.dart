import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/ui/custom_web_view/custom_web_view.dart';
import 'package:world_news/widgets/custom_icon.dart';

class NewsDetailsAppBar extends StatelessWidget {
  const NewsDetailsAppBar({required this.sourceUrl,Key? key}) : super(key: key);
  final String sourceUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        const Spacer(),
        CustomIcon(onTapped: () {}, svgPic: "assets/svg/share.svg"),
        SizedBox(width: 2.w),
        CustomIcon(onTapped: ()=>Navigator.push(context, MaterialPageRoute(
          builder: (context) => CustomWebView(url:sourceUrl ),)), svgPic: "assets/svg/link.svg"),
        SizedBox(width: 2.w),
        CustomIcon(onTapped: () {}, svgPic: "assets/svg/bookmark.svg"),
        SizedBox(width: 2.w),
        CustomIcon(onTapped: () {}, svgPic: "assets/svg/menu.svg"),
      ],
    );
  }
}
