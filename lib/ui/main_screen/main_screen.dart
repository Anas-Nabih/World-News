import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/base/view/base_state.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/main_screen/main_presenter.dart';
import 'package:world_news/ui/main_screen/main_provider.dart';
import 'package:world_news/widgets/bottom_navigation_bar.dart';
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
            bottomNavigationBar: CustomBottomNavigationBar(mainProvider: mainProvider),
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
