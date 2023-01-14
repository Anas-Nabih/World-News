import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:world_news/ui/search/search_screen.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key? key}) : super(key: key);


  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: ()=>Utils.push(context: context, navigationScreen: const SearchScreen()),
      child: Container(
        height: 6.h,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
            color: appProvider.darkTheme
                ? MColors.kDarkContainerBG
                : Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Search",style: TextStyle(fontSize: 11.sp,color:appProvider.darkTheme ?
            Colors.white.withOpacity(0.7): Colors.grey.withOpacity(0.7)),),
            Icon(
                Icons.search,color:  appProvider.darkTheme
                ? Colors.white.withOpacity(0.6)
                : Colors.grey.withOpacity(0.4))
          ],
        ),
      ),
    );
  }
}
