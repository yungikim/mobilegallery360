import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../util/Util.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const ImageTest());
}

class ImageTest extends StatelessWidget {
  const ImageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tx(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Tx extends StatelessWidget {
  const Tx({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("이미지 캐쉬"),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      "https://www.gallery360.co.kr/artimage/gallery360@gallery360.co.kr-spl-1574126094075/art/watermark/gallery360@gallery360.co.kr-spl-1574126094075_2efd70d5fa6a9872dd6ddd0ede8a282a.2012219.jpg?open&ver=1594786835744"),
                  fit: BoxFit.cover,
                )),
              ),
              cacheImage(
                url:
                    "https://www.gallery360.co.kr/artimage/qkrdudgml1002@daum.net/art/watermark/qkrdudgml1002@daum.net_24a833835f42811ffd6928cc121915fd.12055140.jpg?open&ver=1663747521044",
                width: double.infinity,
                height: 300,
                childtext: Stack(
                  children: [
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Column(
                        children: [
                          Text(
                            "1111111",
                            style: TextStyle(fontSize: 30),
                          ),
                          Text("22222222")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//
// class cacheImage extends StatelessWidget {
//   cacheImage({
//     super.key,
//     required this.url,
//     required this.width,
//     required this.height,
//     this.childtext,
//   });
//
//   final String url;
//   final double width;
//   final double height;
//   final Widget? childtext;
//
//   final CacheManager cacheManager = CacheManager(
//     Config(
//       'images_Key',
//       maxNrOfCacheObjects: 100,
//       stalePeriod: const Duration(days: 7)
//     )
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       cacheManager: cacheManager,
//       fadeInDuration: const Duration(milliseconds: 100),
//       key: UniqueKey(),
//       imageUrl: url,
//       imageBuilder: (context, imageProvider) => Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//             image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
//         child: childtext,
//       ),
//       placeholder: (context, url) => Container(
//         child: const CircularProgressIndicator(),
//       ),
//       errorWidget: (context, url, error) => Container(
//         width: double.infinity,
//         height: 300,
//         color: Colors.grey.withOpacity(0.6),
//         alignment: Alignment.center,
//         child: const Text("No Image file."),
//       ),
//     );
//   }
// }
