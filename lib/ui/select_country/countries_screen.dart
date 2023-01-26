import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/main_screen/main_screen.dart';
import 'package:world_news/ui/select_country/countries_provider.dart';
import 'package:world_news/widgets/country_item.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  Widget build(BuildContext context) {
    CountriesProvider countriesProvider = CountriesProvider();
    return SafeArea(
      child: ChangeNotifierProvider<CountriesProvider>(
          create: (context) => countriesProvider,
          child: Consumer<CountriesProvider>(
            builder: (context, value, child) => Scaffold(
              body: Padding(
                padding: EdgeInsets.only(
                    top: 2.h, bottom: 1.h, right: 3.w, left: 3.w),
                child: Column(
                  children: [
                    Visibility(
                      visible: countriesProvider.countryIndex == -1,
                      child: Text(
                      "Select Your Country",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: MColors.kPrimaryColor,
                          fontWeight: FontWeight.w500),
                    ),),
                    Visibility(
                      visible: countriesProvider.countryIndex != -1,
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
                            onTap: ()=>Utils.push(context: context,
                                navigationScreen: const MainScreen()),
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
                    SizedBox(height: 2.h),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: countriesProvider.countries.length,
                        itemBuilder: (context, index) =>
                             CountryItem(
                               index:index,
                                 countriesProvider: countriesProvider,
                                 countryCode:"${countriesProvider.countries[index]["code"]}",
                                 countryAR:"${countriesProvider.countries[index]["countryAR"]}",
                                 countryEN:"${countriesProvider.countries[index]["countryEN"]}",
                             ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
