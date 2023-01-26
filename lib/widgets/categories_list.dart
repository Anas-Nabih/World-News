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
                        title: appProvider.categoriesList(
                            context: context)[index])),
                child: CategoryItem(
                    img:
                        "https://firebasestorage.googleapis.com/v0/b/e-commerce-a7827.appspot.com/o/pc.jpg?alt=media&token=ae3199b4-4650-4e7c-9607-b9ac0f4cab94",
                    title: appProvider.categoriesList(context: context)[index]),
              )),
    );
  }
}
