import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/preferences/Prefs.dart';
import 'package:world_news/generated/l10n.dart';
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
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).selectLanguage,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LanguageContainer(title: S.of(context).arabic, onTapped: () {
                  Prefs.setAppLocal("ar");
                  appProvider.appLocale = "ar";
                  Navigator.pop(context);
                }),
                LanguageContainer(title: S.of(context).english, onTapped: () {
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
