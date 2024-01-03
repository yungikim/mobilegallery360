import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import '../../const/const.dart';

class PhotoDisplay extends StatefulWidget {
  const PhotoDisplay({super.key, required this.dockey, required this.email});
  final String dockey;
  final String email;
  @override
  State<PhotoDisplay> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoDisplay> {
  @override
  Widget build(BuildContext context) {
    //String url = "https://www.gallery360.co.kr/artimage/mblue4444@gmail.com-spl-1560342398964/art/watermark/mblue4444@gmail.com-spl-1560342398964_9e9d575e7189d4b5388c355899688514.958188.jpg";

    String url = "$base_url/artimage/${widget.email}/art/watermark/${widget.dockey}.jpg";
    return Scaffold(
      appBar: AppBar(
       // title: const Text("확대보기",style: TextStyle(color: Colors.white, fontSize: 18),),
        centerTitle: false,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
      ),
      body: PhotoView(
        imageProvider: NetworkImage(url),
        initialScale: PhotoViewComputedScale.contained * 0.95,
        minScale: PhotoViewComputedScale.contained * 0.5,
        maxScale: PhotoViewComputedScale.contained * 10.0,
        heroAttributes: PhotoViewHeroAttributes(tag: widget.dockey),
      ),
    );
  }
}
