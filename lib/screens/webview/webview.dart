import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewTaxi extends StatefulWidget {
  @override
  _WebviewTaxiState createState() => _WebviewTaxiState();
}

class _WebviewTaxiState extends State<WebviewTaxi> {
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://taxiforyou.ch/',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
