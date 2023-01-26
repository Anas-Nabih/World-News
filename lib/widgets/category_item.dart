import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/image_loader.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.title, required this.img})
      : super(key: key);

  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(2, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 25.h,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: ImageLoader.loadCachedNetworkImage(img),
            ),
          ),
          Spacer(),
          Center(
              child: Text(
            title,
            style: TextStyle(fontSize: 12.sp),
          )),
          Spacer(),
        ],
      ),
    );
  }
}
