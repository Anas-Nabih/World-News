import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/widgets/filter_item.dart';

class FilterList extends StatelessWidget {
  const FilterList({required this.categories, Key? key}) : super(key: key);

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => FilterItem(
                category: categories[index],
              )),
    );
  }
}
