import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:world_news/ui/custom_web_view/custom_wev_view_provider.dart';
import 'package:world_news/widgets/arrow_back.dart';
import 'package:sizer/sizer.dart';

class CustomWebView extends StatefulWidget {
  const CustomWebView({required this.url,Key? key}) : super(key: key);
  final String url;

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {

  final webViewProvider = CustomWebViewProvider();
  late WebViewController controller ;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            debugPrint("page statues: ${webViewProvider.pageLoaded}");
            webViewProvider.pageLoaded = true;
            debugPrint("page statues: ${webViewProvider.pageLoaded}");
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomWebViewProvider>(
      create: (_)=>webViewProvider,
      child: Consumer<CustomWebViewProvider>(builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.url, style: TextStyle(fontSize: 10.sp,color: Colors.black)),
          leading: const ArrowBack(),
          actions: [
            SvgPicture.asset("assets/svg/menu.svg")
          ],
        ),
        body: webViewProvider.pageLoaded ? WebViewWidget(controller: controller) :
        const LinearProgressIndicator(),
      ),),
    );
  }


}
