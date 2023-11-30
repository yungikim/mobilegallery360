
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

// import 'dart:io';
//
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}





//
//
//
// InAppLocalhostServer localhostServer = new InAppLocalhostServer(documentRoot: 'asset');
//
// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }
//
// void main() async{
//   HttpOverrides.global = MyHttpOverrides();  //N
//   WidgetsFlutterBinding.ensureInitialized();
//   // if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android){
//   //     await InAppWebViewController.
//   // }
//   // if (!kIsWeb){
//   //   print("웹 서버 시작한다.");
//   //   await localhostServer.start();
//   // }
//   runApp(const MyApp());
// }
//
// void inx() async{
//   if (!kIsWeb){
//     print("웹 서버 시작한다.");
//     await localhostServer.start();
//   }
// }
//
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//   //  inx();
//
//     return MaterialApp(
//       home: wapp(),
//     );
//   }
// }
//
//
// class wapp extends StatefulWidget {
//   const wapp({super.key});
//
//
//
//   @override
//   State<wapp> createState() => _wappState();
// }
//
//
// class _wappState extends State<wapp> {
//
//   late InAppWebViewController webView;
//
//   @override
//   void dispose(){
//     localhostServer.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: (){
//               Get.back();
//             },
//             icon: const Icon(Icons.arrow_back_ios),
//           ),
//           title: const Text("Local Web"),
//         ),
//         //  appBar: AppBar(title: Text("In App Webview"),),
//         body: Container(
//           height: 500,
//           color: Colors.red,
//           child: InAppWebView(
//            //initialFile: "assets/html/index.html",
//
//             initialUrlRequest: URLRequest(
//              //   url: Uri.parse('http://localhost:8080/html/index.html?open&ver=1.0')
//                 url: Uri.parse('https://www.gallery360.co.kr')
//             ),
//             initialOptions: InAppWebViewGroupOptions(
//                 android: AndroidInAppWebViewOptions(useHybridComposition: true),
//                 ios: IOSInAppWebViewOptions(
//                   allowsInlineMediaPlayback: true,
//                 ),
//                 crossPlatform: InAppWebViewOptions(
//                     useShouldOverrideUrlLoading: true,
//                     mediaPlaybackRequiresUserGesture: false
//                 )
//             ),
//
//             onWebViewCreated: (controller) {
//               controller.addJavaScriptHandler(handlerName: 'handlerFoo', callback: (args) {
//                 // return data to the JavaScript side!
//                 return {
//                   'bar': 'bar_value', 'baz': 'baz_value'
//                 };
//               });
//
//               controller.addJavaScriptHandler(handlerName: 'handlerFooWithArgs', callback: (args) {
//                 print(args[0]);
//                 return {"name" : "김윤기"};
//                 // it will print: [1, true, [bar, 5], {foo: baz}, {bar: bar_value, baz: baz_value}]
//               });
//             },
//             onConsoleMessage: (controller, consoleMessage) {
//               print(consoleMessage.message);
//
//               // it will print: {message: {"bar":"bar_value","baz":"baz_value"}, messageLevel: 1}
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
