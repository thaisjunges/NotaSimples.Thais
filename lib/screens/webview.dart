//import "package:abo_rs/Utils/constants.dart";
import "package:flutter/material.dart";
import "package:flutter_easyloading/flutter_easyloading.dart";
import "package:webview_flutter/webview_flutter.dart";

class WebView extends StatefulWidget {
  final String title;
  final String url;
  const WebView({super.key, required this.title, required this.url});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  WebViewController? controller;

  @override
  void initState() {
    setState(() {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {
              EasyLoading.show(status: "Carregando...");
            },
            onPageFinished: (String url) {
              EasyLoading.dismiss();
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
    });
    super.initState();
  }

  @override
  void dispose() {
    EasyLoading.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        //backgroundColor: corPrincipal,
      ),
      body: WebViewWidget(controller: controller!),
    );
  }
}
