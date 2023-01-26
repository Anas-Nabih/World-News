import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:world_news/widgets/categories_list.dart';
import 'package:world_news/widgets/screen_app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              EdgeInsets.only(top: 0.h, bottom: 1.h, right: 3.w, left: 3.w),
          child: Column(
            children: [
              const ScreenAppBar(title: "Categories"),
              CategoriesList(appProvider: appProvider),
            ],
          ),
        ),
      ),
    );
  }
}
