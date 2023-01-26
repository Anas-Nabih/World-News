import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/generated/l10n.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/search/search_presenter.dart';
import 'package:world_news/widgets/arrow_back.dart';
import 'package:world_news/widgets/custom_icon.dart';
import 'package:world_news/widgets/custom_text_field.dart';

class SearchScreeAppBar extends StatelessWidget {
  const SearchScreeAppBar({
    Key? key,this.isFromHome = false,required this.presenter
  }) : super(key: key);

  final bool isFromHome;
  final SearchPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: isFromHome,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             const ArrowBack(),
              SizedBox(width: 35.w),
              Padding(
                padding: EdgeInsets.only(top: 2.h,bottom: 1.h),
                child: Text(S.of(context).search,style:TextStyle(
                   color: MColors.kPrimaryColor,
                   fontSize: 12.sp,
                   fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
        Visibility(
          visible: !isFromHome,
          child: Padding(
            padding: EdgeInsets.only(top: 2.h,bottom: 1.h),
            child: Text(S.of(context).search,style:TextStyle(
                color: MColors.kPrimaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500)),
          ),
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            Expanded(child: CustomTextField(isFromHome: false,onSubmitted:(val)=>presenter.search(searchKeyWord: val) ,)),
            SizedBox(width: 5.w),
            CustomIcon(onTapped: () {}, svgPic: "assets/svg/filter.svg")
          ],
        )
      ],
    );
  }
}