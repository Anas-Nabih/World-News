import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/base/view/base_state.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/main_screen/main_presenter.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/ui/main_screen/main_provider.dart';
import 'package:world_news/widgets/custom_icon.dart';
import 'package:world_news/widgets/tab_bar_icon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends BaseState<MainScreen, MainPresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final mainProvider = MainProvider();

  @override
  void initState() {
    mainProvider.tabController =
        TabController(length: mainProvider.pages.length, vsync: this);
    mainProvider.tabController.addListener(() {
      setState(() {

      });
      mainProvider.currentTab = mainProvider.tabController.index;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => mainProvider,
      child: Consumer<MainProvider>(
        builder: (context, value, child) => DefaultTabController(
          length: mainProvider.pages.length,
          child: Scaffold(
            body: TabBarView(
              controller: mainProvider.tabController,
              children: mainProvider.pages,
            ),
            bottomNavigationBar: Container(
              height: 7.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(2, 3), // changes position of shadow
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
                      svgPic: "assets/svg/bookmark.svg",
                      isTabSelected:
                      mainProvider.tabController.index == 2 ? true : false),
                  TabBarIcon(
                    iconColor: mainProvider.tabController.index == 3
                        ? Colors.white
                        : MColors.kPrimaryColor.withOpacity(0.8),
                      svgPic: "assets/svg/profile.svg",
                      isTabSelected:
                      mainProvider.tabController.index == 3 ? true : false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  createPresenter() {
    return MainPresenter();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}
