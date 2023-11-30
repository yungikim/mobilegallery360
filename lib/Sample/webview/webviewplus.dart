import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import 'html_webview.dart';

//InAppLocalhostServer localhostServer = new InAppLocalhostServer(documentRoot: 'asset');

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}



void main(){
  HttpOverrides.global = MyHttpOverrides();
  runApp(mm());
}

void inx() async{
  if (!kIsWeb){
    print("웹 서버 시작한다.");
   // await localhostServer.start();
  }
}


class mm extends StatelessWidget {
  const mm({super.key});

  @override
  Widget build(BuildContext context) {
   // inx();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageEditor(),
    );
  }
}

class ImageEditor extends StatefulWidget {
  const ImageEditor({Key? key}) : super(key: key);

  @override
  _ImageEditorState createState() => _ImageEditorState();
}

class _ImageEditorState extends State<ImageEditor> {
  WebViewPlusController? _controller;
  double _height = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height:500,
                  child: WebViewPlus(
                    onWebViewCreated: (controller) {
                      this._controller = controller;
                     // controller.loadUrl('https://pub.dev/packages/webview_flutter_plus');
                     // controller.loadUrl("http://localhost:8080/html/index.html?open&ver=1.0");
                     // controller.loadUrl("https://www.gallery360.co.kr");
                      controller.loadUrl("https://www.gallery360.co.kr/main/vr_gallery/gallery360_vr_pfizer.jsp?key=gallery360@gallery360.co.kr_20191205095123_H2JHELW");
                    },
                    // onPageFinished: (url) {
                    //   _controller!.getHeight().then((double height) {
                    //     print("Height:  " + height.toString());
                    //     setState(() {
                    //       _height = height;
                    //     });
                    //   });
                    // },
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                ),
              ),
              Container(
                height:200,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
              ),
              Container(
                height:200,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
              ),
              Container(
                height:200,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}