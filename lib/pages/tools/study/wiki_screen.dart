import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i18n/localization_intl.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikiScreen extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        NavigatorUtil.back(context, details);
      },
      child: Scaffold(
        appBar: ReturnBar(MyLocalizations.of(context).returnButton),
        body: WebView(
          initialUrl: 'https://www.wikipedia'
              '.org/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            _controller.complete(controller);
            controller.evaluateJavascript('''
        inputs = document.querySelectorAll("input[type=text]");
        inputs.forEach(function(inp) {
            let finalInput = inp;
            finalInput.addEventListener("focus", function() {
                console.log('focus');
                input = finalInput;
                InputValue.postMessage('');
                Focus.postMessage('focus');
           });
           finalInput.addEventListener("focusout", function() {
               console.log('unfocus');
               Focus.postMessage('focusout');
           });
      });
''');
          },
        ),
      ),
    );
  }
}
