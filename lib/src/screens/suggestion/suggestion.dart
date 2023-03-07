import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path/path.dart';

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

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    final split = widget.url.split('/');
    print(split);
    restrictedDomain = '${split[0]}//${split[2]}/';
    print(restrictedDomain);
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
              const PopupMenuItem<PopupActions>(
                value: PopupActions.open,
                child: Text('Apri con browser di sistema'),
              ),
              const PopupMenuItem<PopupActions>(
                value: PopupActions.copy,
                child: Text('Copia indirizzo web'),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {
              print('WebView is loading (progress : $progress%)');
              setState(() {
                loadingStatus = progress.toDouble();
              });
            },
            javascriptChannels: <JavascriptChannel>{
              // _toasterJavascriptChannel(context),
            },
            navigationDelegate: (NavigationRequest request) {
              if (!request.url.startsWith(restrictedDomain)) {
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onWebResourceError: (err) {
              print('Page error: $err');
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
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
