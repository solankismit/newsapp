// // Use Webview to display the url
// //
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// class WebViewUrl1 extends StatelessWidget {
//   const WebViewUrl1({Key? key, required this.url}) : super(key: key);
//   final String url;
//
//   @override
//   Widget build(BuildContext context) {
//     final WebViewController controller = WebViewController();
//     return Scaffold(
//       body: WebViewWidget(controller: controller, url: url),
//         initialUrl: url,
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }
