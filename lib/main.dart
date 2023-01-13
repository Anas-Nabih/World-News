import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/constants.dart';
import 'package:world_news/res/theme/light_theme_style.dart';
import 'package:world_news/ui/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const WorldNews()));
}

class WorldNews extends StatelessWidget {
  const WorldNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) =>  MaterialApp(
        title: Const.appName,
        locale: Locale("ar"),
        theme: LightThemeStyle.lightTheme(context),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
