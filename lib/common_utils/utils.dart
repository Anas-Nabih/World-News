import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  static String formatApiDate(String apiDate) {
    final dateFormat = DateFormat("yyyy-MM-dd","en").format(DateTime.parse(apiDate));
    return dateFormat;
  }

  static showToast({required String msg}){
   return Fluttertoast.showToast(msg: msg,
      backgroundColor: const Color(0xffff827d),);
  }




  /// The background color is translucent black, modify the source code here to be transparent.

  // Future<T> showTransparentDialog<T>({
  //   required BuildContext context,
  //   bool barrierDismissible = true,
  //   required WidgetBuilder builder,
  // }) {
  //   final ThemeData theme = Theme.of(context);
  //   return showGeneralDialog(
  //     barrierDismissible: true,
  //     context: context,
  //     pageBuilder: (BuildContext buildContext, Animation<double> animation,
  //         Animation<double> secondaryAnimation) {
  //       final Widget pageChild = Builder(builder: builder);
  //       return SafeArea(
  //         child: Builder(builder: (BuildContext context) {
  //           return theme != null
  //               ? Theme(data: theme, child: pageChild)
  //               : pageChild;
  //         }),
  //       );
  //     },
  //     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //     barrierColor: const Color(0x00FFFFFF),
  //     transitionDuration: const Duration(milliseconds: 150),
  //     transitionBuilder: _buildMaterialDialogTransitions,
  //   );
  // }
}
