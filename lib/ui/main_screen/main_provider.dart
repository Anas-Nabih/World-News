import 'package:flutter/material.dart';
import 'package:world_news/base/provider/base_provider.dart';
import 'package:world_news/ui/bookmarks/bookmarks_screen.dart';
import 'package:world_news/ui/home/home_screen.dart';
 import 'package:world_news/ui/search/search_screen.dart';
import 'package:world_news/ui/settings/settings_screen.dart';

class MainProvider<T> extends BaseProvider<T> {
  late final TabController tabController;

  int _currentTab = 0;

  int get currentTab => _currentTab;

  set currentTab(int value) {
    _currentTab = value;
    notifyListeners();
  }

  List<Widget> pages = [
    const HomeScreen(),
   const  SearchScreen(isFromHome: false),
    const BookMarksScreen(),
    const SettingsScreen(),
  ];
}
