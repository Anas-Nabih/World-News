import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_news/comman_utils/constants.dart';
import 'package:world_news/ui/home_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const WorldNews()));
}

class WorldNews extends StatelessWidget {
  const WorldNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: Const.appName,
      debugShowCheckedModeBanner: false ,
      home: HomeScreen(),
    );
  }
}
