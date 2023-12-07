import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main(){
  HttpOverrides.global = MyHttpOverrides();  //Network.Image, Http로 ReverseProxy형태의 호출시 SSL에러 처리
  runApp(mm());
}

class mm extends StatelessWidget {
  const mm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoPlayerShow(),
    );
  }
}


class VideoPlayerShow extends StatefulWidget {
  const VideoPlayerShow( {super.key});


  @override
  State<VideoPlayerShow> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerShow> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {

    // _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _controller = VideoPlayerController.asset("assets/movie/gallery360_kr_web.mp4");
        _initializeVideoPlayerFuture = _controller.initialize().then((_) {
          _controller.play();
          _controller.setLooping(true);
          setState(() {

          });
        });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Video Player", style: TextStyle(color: Colors.white),),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
          ),
        ),
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        )
    );
  }
}
