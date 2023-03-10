import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/generated/l10n.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/select_country/countries_screen.dart';
import 'package:world_news/widgets/custom_icon.dart';
import 'package:world_news/widgets/langauage_dialog.dart';
import 'package:world_news/widgets/setting_country_item.dart';
import 'package:world_news/widgets/setting_dark_mode_item.dart';
import 'package:world_news/widgets/setting_more_item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool switchVal = false;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SettingMoreItem(
                title: S.of(context).changeLanguage,
                svgPic: "assets/svg/language.svg",
                onTapped: () {
                  showDialog(
                      context: context,
                      builder: (context) => LanguageDialog());
                },
              ),
              SettingMoreItem(
                title: S.of(context).Country,
                svgPic: "assets/svg/country.svg",
                onTapped: ()=> Utils.push(context: context,
                    navigationScreen: const CountriesScreen(isFromSettings: true,)),
              ),
              const SettingDarkModeItem(),
              // SettingCountryItem()
             ],
          ),
        ),
      ),
    );
  }
}
