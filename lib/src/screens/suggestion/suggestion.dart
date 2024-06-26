import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:wom_pocket/src/utils/utils.dart';

enum PopupActions { open, copy }

class SuggestionScreen extends StatefulWidget {
  SuggestionScreen({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    final split = widget.url.split('/');
    print(split);
    restrictedDomain = '${split[0]}//${split[2]}/';
    print(restrictedDomain);

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      //
      // onWebResourceError: (err) {
      // print('Page error: $err');
      // },
      //
      //
      // gestureNavigationEnabled: true,
      //
      //   ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
            setState(() {
              loadingStatus = progress.toDouble();
            });
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (!request.url.startsWith(restrictedDomain)) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  late String restrictedDomain;
  double loadingStatus = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.url),
        actions: [
          PopupMenuButton<PopupActions>(
            initialValue: null,
            // Callback that sets the selected popup menu item.
            onSelected: (PopupActions item) {
              switch (item) {
                case PopupActions.open:
                  Utils.launchUri(widget.url);
                  break;
                case PopupActions.copy:
                  Clipboard.setData(ClipboardData(text: widget.url)).then((_) {
                    showToast(
                      'Indirizzo web copiato negli appunti',
                      position: ToastPosition.bottom,
                    );
                  });
                  break;
              }
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<PopupActions>>[
              PopupMenuItem<PopupActions>(
                value: PopupActions.open,
                child: Text('openWithSystemBrowser'.tr()),
              ),
              PopupMenuItem<PopupActions>(
                value: PopupActions.copy,
                child: Text('copyWebAddress'.tr()),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (loadingStatus < 100)
            Container(
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Caricamento...', style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        color: Theme.of(context).primaryColor,
                        backgroundColor: Colors.grey,
                        value: loadingStatus / 100,
                        semanticsLabel: 'Linear progress indicator',
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
