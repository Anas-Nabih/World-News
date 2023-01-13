import 'package:flutter/material.dart';
import 'package:world_news/res/colors.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back,color: MColors.kPrimaryColor,));
  }
}
