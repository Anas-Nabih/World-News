import 'package:flag/flag.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:world_news/common_utils/preferences/Prefs.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/select_country/countries_provider.dart';

class CountryItem extends StatefulWidget {
  const CountryItem(
      {Key? key,
      required this.index,
      required this.countryCode,
      required this.countryAR,
      required this.countryEN,
      required this.countriesProvider})
      : super(key: key);
  final String countryCode;
  final String countryAR;
  final String countryEN;
  final int index;
  final CountriesProvider countriesProvider;

  @override
  State<CountryItem> createState() => _CountryItemState();
}

class _CountryItemState extends State<CountryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("${widget.countriesProvider.countryIndex} : ${widget.index} : ${widget.countryCode}");
         widget.countriesProvider.countryIndex = widget.index;
         Prefs.setCountryCode(widget.countryCode);
         widget.countriesProvider.countryCode = widget.countryCode;
        print("${widget.countriesProvider.countryIndex} : ${widget.index} : ${widget.countryCode}");

      },
      child: Container(
        height: 8.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        margin: EdgeInsets.only(top: 2.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: widget.countriesProvider.countryIndex == widget.index
                    ? MColors.kPrimaryColor
                    : Colors.grey.withOpacity(0.4))),
        child: Row(
          children: [
            Container(
              height: 4.h,
              width: 4.h,
              decoration: BoxDecoration(
                  color: MColors.kPrimaryColor, borderRadius: BorderRadius.circular(6)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Flag.fromString(
                  widget.countryCode,
                  height: 1.h,
                  width: 1.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              widget.countryEN,
              style: TextStyle(fontSize: 12.sp),
            ),
            const Spacer(),
            Container(
              height: 2.h,
              width: 2.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.countriesProvider.countryIndex == widget.index
                    ? MColors.kPrimaryColor : Colors.white,
                border: Border.all(color: MColors.kPrimaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
