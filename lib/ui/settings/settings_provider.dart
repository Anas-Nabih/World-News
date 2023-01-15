import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier{
  final List<String> items = [
    'Egypt',
    'USA',
    'England',
    'France',
    'United Arab Emirates',
    'Argentina',
    'Austria',
  ];
  String _selectedValue = "Egypt";

  String get selectedValue => _selectedValue;

  set selectedValue(String value) {
    _selectedValue = value;
    notifyListeners();
  }
}