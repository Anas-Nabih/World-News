import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/settings/settings_provider.dart';

class SettingCountryItem extends StatelessWidget {
  const SettingCountryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = SettingsProvider();
    return ChangeNotifierProvider(
      create: (_) => settingsProvider,
      child: Consumer<SettingsProvider>(
        builder: (context, value, child) =>
            SizedBox(
              child: Row(
                children: [
                  Container(
                    height: 5.h,
                    width: 5.h,
                    padding: EdgeInsets.all(1.h),
                    decoration: BoxDecoration(
                        color: MColors.kPrimaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6)),
                    child: SvgPicture.asset(
                      "assets/svg/country.svg",
                      color: MColors.kPrimaryColor.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: settingsProvider.selectedValue,
                        alignment: AlignmentDirectional.bottomStart,
                        items: settingsProvider.items
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 12.sp),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          settingsProvider.selectedValue = newValue!;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
