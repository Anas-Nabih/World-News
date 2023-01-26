import 'package:flutter/material.dart';
import 'package:world_news/common_utils/preferences/Prefs.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/main_screen/main_screen.dart';
import 'package:world_news/ui/select_country/countries_provider.dart';
import 'package:sizer/sizer.dart';

class CountriesScreenAppBar extends StatefulWidget {
  const CountriesScreenAppBar({Key? key,required this.countriesProvider}) : super(key: key);

  final CountriesProvider countriesProvider;

  @override
  State<CountriesScreenAppBar> createState() => _CountriesScreenAppBarState();
}

class _CountriesScreenAppBarState extends State<CountriesScreenAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: widget.countriesProvider.countryIndex == -1,
          child: Text(
            "Select Your Country",
            style: TextStyle(
                fontSize: 14.sp,
                color: MColors.kPrimaryColor,
                fontWeight: FontWeight.w500),
          ),),
        Visibility(
          visible: widget.countriesProvider.countryIndex != -1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Your Country",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: MColors.kPrimaryColor,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: (){
                  Prefs.setIsCountrySelected(true);
                  Utils.push(context: context,
                      navigationScreen: const MainScreen(),replace: true);
                },
                child: Text(
                  "Continue",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: MColors.kPrimaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
