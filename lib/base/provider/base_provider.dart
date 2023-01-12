import 'package:flutter/material.dart';

class BaseProvider<T> extends ChangeNotifier{
   late T _instance;

  T get instance => _instance;

  void setData(T mData) {
    _instance = mData;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}