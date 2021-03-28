import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class NeurodevScreen extends StatefulWidget {
  @override
  _NeurodevScreenState createState() => new _NeurodevScreenState();
}

class _NeurodevScreenState extends State<NeurodevScreen> {

InAppWebViewController _webViewController;
  String url = "";
  double progress = 0;
  String targetUrl = "";

    final urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Neurodevelopmental Disorders'),
        ),
        body: Container(
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : Container()),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse("https://dsm-psychiatryonline-org.proxy.library.emory.edu/doi/full/10.1176/appi.books.9780890425596.dsm01")),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      verticalScrollBarEnabled: true,
                    )
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                          setState(() {
                            this.url = url.toString();
                            urlController.text = this.url;
                          });
                  // onLoadStart: (InAppWebViewController controller, String url) {
                  //   setState(() {
                  //     this.url = url;
                  //   });
                  },
                  onLoadStop: (controller, url) {
                          setState(() {
                            this.url = url.toString();
                            urlController.text = this.url;
                          });
                  },
                  onProgressChanged: (InAppWebViewController controller, int progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (_webViewController != null) {
                      _webViewController.goBack();
                    }
                  },
                ),
                ElevatedButton(
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (_webViewController != null) {
                      _webViewController.goForward();
                    }
                  },
                ),
                ElevatedButton(
                  child: Icon(Icons.refresh),
                  onPressed: () {
                    if (_webViewController != null) {
                      _webViewController.reload();
                    }
                  },
                ),
              ],
            ),
          ]),
        ),
      );
  }
}










// class NeurodevScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Neurodevelopmental Disorders"),
//       ),
//       body: WebView(
//         initialUrl: "https://dsm-psychiatryonline-org.proxy.library.emory.edu/doi/full/10.1176/appi.books.9780890425596.dsm01",
//         javascriptMode: JavascriptMode.unrestricted,
//       )
//     );
//   }
// }