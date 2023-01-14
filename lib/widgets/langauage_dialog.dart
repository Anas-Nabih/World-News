import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/preferences/Prefs.dart';
import 'package:world_news/generated/l10n.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:world_news/widgets/language_container.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        decoration: BoxDecoration(
            color:
                appProvider.darkTheme ? MColors.kDarkContainerBG : Colors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).selectLanguage,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LanguageContainer(
                    title: S.of(context).arabic,
                    textColor: appProvider.appLocale == "ar"
                        ? Colors.white
                        : Colors.grey,
                    containerBG: appProvider.darkTheme
                        ? appProvider.appLocale == "ar"
                            ? MColors.kPrimaryColor
                            : MColors.kDarkContainerBG
                        : appProvider.appLocale == "ar"
                            ? MColors.kPrimaryColor
                            : Colors.white,
                    onTapped: () {
                      Prefs.setAppLocal("ar");
                      appProvider.appLocale = "ar";
                      Navigator.pop(context);
                    }),
                LanguageContainer(
                    title: S.of(context).english,
                    textColor: appProvider.appLocale == "en"
                        ? Colors.white
                        : Colors.grey,
                    containerBG: appProvider.darkTheme
                        ? appProvider.appLocale == "en"
                            ? MColors.kPrimaryColor
                            : MColors.kDarkContainerBG
                        : appProvider.appLocale == "en"
                            ? MColors.kPrimaryColor
                            : Colors.white,
                    onTapped: () {
                      Prefs.setAppLocal("en");
                      appProvider.appLocale = "en";
                      Navigator.pop(context);
                    }),
              ],
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
