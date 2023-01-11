import 'package:flutter/material.dart';
import 'package:world_news/res/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/widgets/filter_item.dart';

class FilterList extends StatelessWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 10, itemBuilder: (context, index) => FilterItem()),
    );
  }
}
