import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../const/const.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


void main(){
  HttpOverrides.global =
      MyHttpOverrides(); //Network.Image, Http로 ReverseProxy형태의 호출시 SSL에러 처리
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoShow(),
    );
  }
}


class VideoShow extends StatelessWidget {
  const VideoShow({super.key});


  @override
  Widget build(BuildContext context) {

    String url = "https://meet.kmslab.com:8444/WMeet/FDownload.do?id=6571cd8c7be62549e657347c&ty=1";
    url = "${base_url}/intro/gallery360_kr_web.mp4";

    print(url);

    final FlickManager flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(url)));

    // final FlickManager flickManager2 = FlickManager(
    //     videoPlayerController: VideoPlayerController.asset("assets/images/logo/gallery360_kr_web.mp4"));

    return WillPopScope(
      onWillPop: () async {
        // Do something here
        flickManager.flickControlManager?.pause();
        Get.back();
        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            // title: Text(
            //   title, style: const TextStyle(color: Colors.white),),
            leading: IconButton(
              onPressed: () {
                flickManager.flickControlManager?.pause();
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
            ),
          ),
          body: Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: FlickVideoPlayer(
                flickManager: flickManager,
              ),
            ),
          )
      ),
    );
  }
}
