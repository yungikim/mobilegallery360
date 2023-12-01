import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(PP());
}

class PP extends StatelessWidget {
  const PP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebviewGestureRecognizer(),
    );
  }
}


class WebviewGestureRecognizer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new WebviewGestureRecognizerState();
}

class WebviewGestureRecognizerState extends State<WebviewGestureRecognizer> {

  ScrollController _controller = new ScrollController();

  late WebViewController wvController;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      // here is the CustomScrollView offset
      print(_controller.offset);
    });
  }

  hideAppBar() {
    _controller.animateTo(100.0,
        duration: new Duration(milliseconds: 1000), curve: Curves.linear);
  }

  showAppBar() {
    _controller.animateTo(0.0,
        duration: new Duration(milliseconds: 1000), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
            title: const Text("webview GuesureRecognizer"),
            floating: true,
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            fillOverscroll: false,
            child: WebView(
              debuggingEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                new Factory<OneSequenceGestureRecognizer>(
                      () => CustomGestureWidget(),
                ),
              ].toSet(),
              onWebViewCreated: (WebViewController webViewController) {
                webViewController.loadUrl(
                  "https://www.gallery360.co.kr/main/vr_gallery/gallery360_vr_pfizer.jsp?key=gallery360@gallery360.co.kr_20191205095123_H2JHELW",
                );
                wvController = webViewController;
              },
            ),
          ),
        ],
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