import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fortuna/Style/StyleLoading.dart';
import 'package:fortuna/widget/HeaderWidget.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  const PaymentWebView({Key? key}) : super(key: key);

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController _con;
  String idOrder = Get.arguments;
  String st1 = '''
  <!DOCTYPE html>
 <html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <script type="text/javascript"
  src="https://app.midtrans.com/snap/snap.js"
  data-client-key="Mid-client-YHoH4551AszUKnxt"></script>
  </head>
  <body>
    
    <script type="text/javascript">
    snap.pay("''';

  String st3 = ''' ") </script>
  </body>
</html>''';

  _loadHTML() async {
    print(st1 + idOrder + st3);
    _con.loadUrl(Uri.dataFromString(st1 + idOrder + st3,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: 'https://flutter.dev',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              // StyleLoadingWidget(context);
              _controller.complete(webViewController);
              _con = webViewController;
              _loadHTML();
            },
            onProgress: (int progress) {
              // if (Navigator.canPop(context) && progress == 100) {
              //   Get.back();
              // }
            },
            gestureNavigationEnabled: true,
          );
        }),
      ),
    );
  }
}
