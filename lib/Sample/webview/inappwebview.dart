

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../const/const.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

//  await Permission.camera.request();
//  await Permission.microphone.request();
  // if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android){
  //     await InAppWebViewController.
  // }
  // if (!kIsWeb){
  //   print("웹 서버 시작한다.");
  //   await localhostServer.start();
  // }
  runApp(const MyApp());
}

void inx() async{
  if (!kIsWeb){
    print("웹 서버 시작한다.");
   // await localhostServer.start();
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
  //  inx();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: wapp(),
    );
  }
}


class wapp extends StatefulWidget {
  const wapp({super.key});



  @override
  State<wapp> createState() => _wappState();
}


class _wappState extends State<wapp> {

  late InAppWebViewController webView;

  @override
  void dispose(){
   // localhostServer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Local Web"),
        ),
        //  appBar: AppBar(title: Text("In App Webview"),),
        body:  InAppWebView(
               //   initialFile: "assets/html/index.html",
                  initialUrlRequest: URLRequest(
                       url: Uri.parse('https://www.youtube.com/'),
                   //   url: Uri.parse('https://www.gallery360.co.kr/main/vr_gallery/gallery360_vr_pfizer.jsp?key=gallery360@gallery360.co.kr_20191205095123_H2JHELW')
                  ),

          // initialUrlRequest: URLRequest(
          //   //   url: Uri.parse('http://localhost:8080/html/index.html?open&ver=1.0')
          //     url: Uri.parse(
          //         '$base_url/main/vr_gallery/gallery360_vr_pfizer.jsp?key=gallery360@gallery360.co.kr_20200828111648_QI2UPLR')),
          //
          //         onReceivedServerTrustAuthRequest: (controller, challenge) async {
          //           print(challenge);
          //           return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
          //         },

                  androidOnPermissionRequest: (controller, origin, resources) async {
                    return PermissionRequestResponse(
                        resources: resources,
                        action: PermissionRequestResponseAction.GRANT);
                  },

                  // initialOptions: InAppWebViewGroupOptions(
                  //     android: AndroidInAppWebViewOptions(useHybridComposition: true),
                  //     ios: IOSInAppWebViewOptions(
                  //       allowsInlineMediaPlayback: true,
                  //     ),
                  //     crossPlatform: InAppWebViewOptions(
                  //         supportZoom: false,
                  //         preferredContentMode: UserPreferredContentMode.MOBILE,
                  //         useShouldOverrideUrlLoading: true,
                  //         mediaPlaybackRequiresUserGesture: false
                  //     )
                  // ),

          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
               transparentBackground: true,
               allowFileAccessFromFileURLs: true,
               useShouldOverrideUrlLoading: true,
               allowUniversalAccessFromFileURLs: true,
               javaScriptEnabled: true,
               javaScriptCanOpenWindowsAutomatically: false,
              preferredContentMode: UserPreferredContentMode.MOBILE,
                mediaPlaybackRequiresUserGesture: false,
            ),
            ios: IOSInAppWebViewOptions(
              allowsInlineMediaPlayback: true,
              allowsPictureInPictureMediaPlayback: false,
              allowsAirPlayForMediaPlayback: false,
              useOnNavigationResponse: true,
              scrollsToTop: false,
            ),
            android: AndroidInAppWebViewOptions(
              useHybridComposition: true,
              mixedContentMode: AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
            ),
          ),

                  onWebViewCreated: (controller) {
                    controller.addJavaScriptHandler(handlerName: 'handlerFoo', callback: (args) {
                      // return data to the JavaScript side!
                      return {
                        'bar': 'bar_value', 'baz': 'baz_value'
                      };
                    });

                    controller.addJavaScriptHandler(handlerName: 'handlerFooWithArgs', callback: (args) {
                      print(args[0]);
                      return {"name" : "김윤기"};
                      // it will print: [1, true, [bar, 5], {foo: baz}, {bar: bar_value, baz: baz_value}]
                    });
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