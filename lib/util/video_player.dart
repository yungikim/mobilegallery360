import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse("https://www.gallery360.co.kr/intro/gallery360_kr_web.mp4"));
        _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
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
            onPressed: () {},
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
