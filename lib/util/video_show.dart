import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoShow extends StatelessWidget {
  const VideoShow({super.key, required this.url, required this.title});
  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {

    final FlickManager flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(url)));

    void _moveToScreen2(BuildContext context) =>
        Navigator.pushReplacementNamed(context, "screen2");

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
            title: Text(
              title, style: const TextStyle(color: Colors.white),),
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
