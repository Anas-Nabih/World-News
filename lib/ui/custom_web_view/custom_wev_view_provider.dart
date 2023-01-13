import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:world_news/base/provider/base_provider.dart';

class CustomWebViewProvider extends BaseProvider{

  bool _pageLoaded = false;

  bool get pageLoaded => _pageLoaded;

  set pageLoaded(bool value) {
    _pageLoaded = value;
    debugPrint("page statues provider: ${_pageLoaded}");
    notifyListeners();
  }

  WebViewController controller = WebViewController()
     ..setJavaScriptMode(JavaScriptMode.unrestricted)
     ..setBackgroundColor(const Color(0x00000000))
     ..setNavigationDelegate(
       NavigationDelegate(
         onProgress: (int progress) {
           // Update loading bar.
         },
         onPageStarted: (String url) {},
         onPageFinished: (String url) {},
         onWebResourceError: (WebResourceError error) {},
         onNavigationRequest: (NavigationRequest request) {
           if (request.url.startsWith('https://www.youtube.com/')) {
             return NavigationDecision.prevent;
           }
           return NavigationDecision.navigate;
         },
       ),
     )
     ..loadRequest(Uri.parse('https://flutter.dev'));
}