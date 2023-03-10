import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/generated/l10n.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:world_news/widgets/search_container.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    this.isFromHome = true,
    this.onSubmitted,
    Key? key,
   }) : super(key: key);

 final bool isFromHome;
  void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return isFromHome ? const SearchContainer() : SizedBox(
      height: 6.h,
      child: TextField(
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: appProvider.darkTheme
                  ? Colors.white.withOpacity(0.6)
                  : Colors.grey.withOpacity(0.4),
            ),
            hintText: S.of(context).search,
            hintStyle: TextStyle(color:appProvider.darkTheme ?
            Colors.white.withOpacity(0.7): Colors.grey.withOpacity(0.7)),
            filled: true,
            fillColor: appProvider.darkTheme
                ? MColors.kDarkContainerBG
                : Colors.grey.withOpacity(0.2),
            border: buildBorderStyle(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.h, horizontal: 3.w)),
      ),
    );
  }

  OutlineInputBorder buildBorderStyle() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none);
  }
}
