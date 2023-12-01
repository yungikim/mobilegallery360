import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gallery360/const/const.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class VrDetailPage extends StatelessWidget {
  const VrDetailPage({super.key, required this.dockey});

  final String dockey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  weight: 10,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              // title: Text("111111", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.7)),),
              floating: true,
              pinned: false,
              expandedHeight: 520,
              flexibleSpace: FlexibleSpaceBar(
                background: InAppWebView(
                  //initialFile: "assets/html/index.html",
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                      () => CustomGestureWidget(),
                    ),
                  },
                  initialUrlRequest: URLRequest(
                      //   url: Uri.parse('http://localhost:8080/html/index.html?open&ver=1.0')
                      url: Uri.parse(
                          '$base_url/main/vr_gallery/gallery360_vr_pfizer.jsp?key=${dockey}')
                      //  url: Uri.parse("https://www.google.com")
                      ),

                  onReceivedServerTrustAuthRequest:
                      (controller, challenge) async {
                    print(challenge);
                    return ServerTrustAuthResponse(
                        action: ServerTrustAuthResponseAction.PROCEED);
                  },

                  initialOptions: InAppWebViewGroupOptions(
                      android: AndroidInAppWebViewOptions(
                        useHybridComposition: true,
                        mixedContentMode: AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
                      ),
                      ios: IOSInAppWebViewOptions(
                        allowsInlineMediaPlayback: true,
                        useOnNavigationResponse: true,
                        scrollsToTop: false,
                      ),
                      crossPlatform: InAppWebViewOptions(
                        supportZoom: true,
                        preferredContentMode: UserPreferredContentMode.MOBILE,
                        useShouldOverrideUrlLoading: true,
                        mediaPlaybackRequiresUserGesture: true,
                        cacheEnabled: true,
                        clearCache: true,
                        transparentBackground: true,
                        javaScriptEnabled: true,
                      )),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 1000,
                color: Colors.blue,
              ),
            )
          ],
        ),
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
