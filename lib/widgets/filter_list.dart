import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:world_news/ui/home/home_presenter.dart';
import 'package:world_news/ui/home/home_provider.dart';
import 'package:world_news/widgets/filter_item.dart';

class FilterList extends StatelessWidget {
  const FilterList(
      {Key? key, required this.presenter, required this.homeProvider})
      : super(key: key);

  final HomeProvider homeProvider;
  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return SizedBox(
      height: 5.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeProvider.categories.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  homeProvider.currentIndex = index;

                  homeProvider.loadingArticles = false;
                  presenter.getHomeNewsByCategory(
                      category: homeProvider.categories[index]);

                  debugPrint(homeProvider.categories[index]);
                },
                child: FilterItem(
                  bgColor: homeProvider.currentIndex == index
                      ? MColors.kPrimaryColor
                      : appProvider.darkTheme ? MColors.kDarkContainerBG : Colors.white,
                  textColor: homeProvider.currentIndex == index
                      ? Colors.white
                      : MColors.kPrimaryColor,
                  category: homeProvider.categories[index],
                ),
              )),
    );
  }
}
