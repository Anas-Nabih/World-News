import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:world_news/common_utils/constants.dart';
import 'package:world_news/res/theme/dark_theme_style.dart';
import 'package:world_news/res/theme/light_theme_style.dart';
import 'package:world_news/ui/home/home_screen.dart';
import 'package:world_news/ui/main_screen/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const WorldNews()));
}

class WorldNews extends StatefulWidget {
  const WorldNews({Key? key}) : super(key: key);

  @override
  State<WorldNews> createState() => _WorldNewsState();
}

class _WorldNewsState extends State<WorldNews> {
  AppProvider appProvider = AppProvider();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) =>
          ChangeNotifierProvider(
              create: (_) => appProvider,
              child: Consumer<AppProvider>(
                builder: (context, value, child) => (MaterialApp(
                  title: Const.appName,
                  theme: appProvider.darkTheme
                      ? DarkThemeStyle.darkTheme(context)
                      : LightThemeStyle.lightTheme(context),
                  debugShowCheckedModeBanner: false,
                  home: MainScreen(),
                )),
              )),
    );
  }
}
