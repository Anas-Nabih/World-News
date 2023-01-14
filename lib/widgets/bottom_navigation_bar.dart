import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:world_news/ui/main_screen/main_provider.dart';
import 'package:world_news/widgets/tab_bar_icon.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({required this.mainProvider, Key? key})
      : super(key: key);

  final MainProvider mainProvider;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Container(
      height: 7.h,
      decoration: BoxDecoration(
        color: appProvider.darkTheme ? MColors.kDarkContainerBG : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        boxShadow: [
          appProvider.darkTheme
              ? BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(1, 3), // changes position of shadow
                )
              : BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(2, 3), // changes position of shadow
                ),
        ],
      ),
      child: TabBar(
        indicatorColor: Colors.transparent,
        controller: mainProvider.tabController,
        tabs: [
          TabBarIcon(
              iconColor: mainProvider.tabController.index == 0
                  ? Colors.white
                  : MColors.kPrimaryColor.withOpacity(0.8),
              svgPic: "assets/svg/home.svg",
              isTabSelected:
                  mainProvider.tabController.index == 0 ? true : false),
          TabBarIcon(
              iconColor: mainProvider.tabController.index == 1
                  ? Colors.white
                  : MColors.kPrimaryColor.withOpacity(0.8),
              svgPic: "assets/svg/search.svg",
              isTabSelected:
                  mainProvider.tabController.index == 1 ? true : false),
          TabBarIcon(
              iconColor: mainProvider.tabController.index == 2
                  ? Colors.white
                  : MColors.kPrimaryColor.withOpacity(0.8),
              svgPic: "assets/svg/bookmark_filled.svg",
              isTabSelected:
                  mainProvider.tabController.index == 2 ? true : false),
          TabBarIcon(
              iconColor: mainProvider.tabController.index == 3
                  ? Colors.white
                  : MColors.kPrimaryColor.withOpacity(0.8),
              svgPic: "assets/svg/settings.svg",
              isTabSelected:
                  mainProvider.tabController.index == 3 ? true : false),
        ],
      ),
    );
  }
}
