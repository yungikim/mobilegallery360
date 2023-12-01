

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.camera.request();
  await Permission.microphone.request();
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
        body: NestedScrollView(
          headerSliverBuilder: (context, isInnerBoxScrolled) =>[
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                color: Colors.green,
              ),
            )
          ],
          body: InAppWebView(
            //initialFile: "assets/html/index.html",
            //gestureRecognizers: Set()..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),

            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
              new Factory<OneSequenceGestureRecognizer>(
                    () => CustomGestureWidget(),
              ),
            ].toSet(),

            initialUrlRequest: URLRequest(
              //   url: Uri.parse('http://localhost:8080/html/index.html?open&ver=1.0')
                url: Uri.parse('https://www.gallery360.co.kr/main/vr_gallery/gallery360_vr_pfizer.jsp?key=gallery360@gallery360.co.kr_20191205095123_H2JHELW')
              //  url: Uri.parse("https://www.google.com")
            ),

            onReceivedServerTrustAuthRequest: (controller, challenge) async {
              print(challenge);
              return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
            },

            initialOptions: InAppWebViewGroupOptions(
                android: AndroidInAppWebViewOptions(useHybridComposition: true),
                ios: IOSInAppWebViewOptions(
                  allowsInlineMediaPlayback: true,
                ),
                crossPlatform: InAppWebViewOptions(
                    supportZoom: true,
                    preferredContentMode: UserPreferredContentMode.MOBILE,
                    useShouldOverrideUrlLoading: true,
                    mediaPlaybackRequiresUserGesture: true
                )
            ),
          ),
        )
      ),
    );
  }
}


class CustomGestureWidget extends OneSequenceGestureRecognizer {
  CustomGestureWidget();

  @override
  void addAllowedPointer(PointerDownEvent event) {
    print("PointerDownEvent: $event");
    startTrackingPointer(event.pointer, event.transform);
    resolve(GestureDisposition.accepted);
    stopTrackingPointer(event.pointer);
  }

  @override
  String get debugDescription => 'eager';

  @override
  void didStopTrackingLastPointer(int pointer) {
    print("pointer: $pointer");
  }

  @override
  void handleEvent(PointerEvent event) {
    print("event: $event");
  }
}


// class PlatformViewVerticalGestureRecognizer
//     extends VerticalDragGestureRecognizer {
//   PlatformViewVerticalGestureRecognizer({PointerDeviceKind kind})
//       : super(kind: kind);
//
//   Offset _dragDistance = Offset.zero;
//
//   @override
//   void addPointer(PointerEvent event) {
//     startTrackingPointer(event.pointer);
//   }
//
//   @override
//   void handleEvent(PointerEvent event) {
//     _dragDistance = _dragDistance + event.delta;
//     if (event is PointerMoveEvent) {
//       final double dy = _dragDistance.dy.abs();
//       final double dx = _dragDistance.dx.abs();
//
//       if (dy > dx && dy > kTouchSlop) {
//         // vertical drag - accept
//         resolve(GestureDisposition.accepted);
//         _dragDistance = Offset.zero;
//       } else if (dx > kTouchSlop && dx > dy) {
//         resolve(GestureDisposition.accepted);
//         // horizontal drag - stop tracking
//         stopTrackingPointer(event.pointer);
//         _dragDistance = Offset.zero;
//       }
//     }
//   }
//
//   @override
//   String get debugDescription => 'horizontal drag (platform view)';
//
//   @override
//   void didStopTrackingLastPointer(int pointer) {}
// }