import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocalResourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Resources"),
      ),
      body: WebView(
        initialUrl: "https://dsm-psychiatryonline-org.proxy.library.emory.edu/doi/full/10.1176/appi.books.9780890425596.dsm01",
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}