import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key, required this.url});

  final String url;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //title: const Text("LinkView", style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
          ),
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(
              url: Uri.parse(widget.url),
          ),
          onReceivedServerTrustAuthRequest: (controller, challenge) async {
            return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
          },

          androidOnPermissionRequest: (controller, origin, resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
          initialOptions: InAppWebViewGroupOptions(
              android: AndroidInAppWebViewOptions(useHybridComposition: true),
              ios: IOSInAppWebViewOptions(
                allowsInlineMediaPlayback: true,
              ),
              crossPlatform: InAppWebViewOptions(
                  supportZoom: true,
                  useShouldOverrideUrlLoading: true,
                  mediaPlaybackRequiresUserGesture: true
              )
          ),

          onWebViewCreated: (controller) {
            // controller.addJavaScriptHandler(handlerName: 'handlerFoo', callback: (args) {
            //   // return data to the JavaScript side!
            //   return {
            //     'bar': 'bar_value', 'baz': 'baz_value'
            //   };
            // });

            // controller.addJavaScriptHandler(handlerName: 'handlerFooWithArgs', callback: (args) {
            //   print(args[0]);
            //   return {"name" : "김윤기"};
            //   // it will print: [1, true, [bar, 5], {foo: baz}, {bar: bar_value, baz: baz_value}]
            // });
          },
          onConsoleMessage: (controller, consoleMessage) {
            print(consoleMessage.message);
            // it will print: {message: {"bar":"bar_value","baz":"baz_value"}, messageLevel: 1}
          },
        ),
      ),
    );
  }
}
