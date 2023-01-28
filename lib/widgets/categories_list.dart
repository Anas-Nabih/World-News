import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:world_news/ui/category/category_screen.dart';
import 'package:world_news/widgets/category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.appProvider,
  }) : super(key: key);

  final AppProvider appProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.only(
            top: 1.h,
          ),
          itemCount: appProvider.categoriesList(context: context).length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 30.h,
              mainAxisSpacing: 2.h,
              crossAxisSpacing: 3.w),
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => Utils.push(
                    context: context,
                    navigationScreen: CategoryScreen(
                      category: "${appProvider.categoriesList(context: context)[index]["key"]}",
                        title: "${appProvider.categoriesList(context: context)[index]["title"]}")),
                child: CategoryItem(
                    img:"${appProvider.categoriesList(context: context)[index]["img"]}",
                    title: "${appProvider.categoriesList(context: context)[index]["title"]}"),
              )),
    );
  }
}
