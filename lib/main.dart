import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/preferences/Prefs.dart';
import 'package:world_news/generated/l10n.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:world_news/common_utils/preferences/const.dart';
import 'package:world_news/res/theme/dark_theme_style.dart';
import 'package:world_news/res/theme/light_theme_style.dart';
import 'package:world_news/ui/home/home_screen.dart';
import 'package:world_news/ui/main_screen/main_screen.dart';
import 'package:world_news/ui/splash/splash_screen.dart';

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
  void initState() {
    Prefs.getAppLocal.then((value) => appProvider.appLocale = value);
    Prefs.isDarkMode.then((value) => appProvider.darkTheme = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) =>
          ChangeNotifierProvider(
              create: (_) => appProvider,
              child: Consumer<AppProvider>(
                builder: (context, value, child) => (MaterialApp(

                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales:const [
                    Locale('en'),
                    Locale('ar'),
                  ],
                  locale: Locale(appProvider.appLocale),
                  title: Const.appName,
                  theme: appProvider.darkTheme
                      ? DarkThemeStyle.darkTheme(context)
                      : LightThemeStyle.lightTheme(context),
                  debugShowCheckedModeBanner: false,
                  home: SplashScreen(),
                )),
              )),
    );
  }
}
