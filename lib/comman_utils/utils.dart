import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static void push(
      {required BuildContext context,
      required Widget navigationScreen,
      bool replace = false}) {
    if (replace) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => navigationScreen),
          (Route route) => false);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => navigationScreen,
          ));
    }
  }

  static String formatDate(DateTime dateTime) {
    String formattedDate = DateFormat("yyyy-MM-dd").format(dateTime);
    return formattedDate;
  }
}
