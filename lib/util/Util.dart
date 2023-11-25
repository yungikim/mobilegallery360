import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';

class Util{
  static String chageText(String str){
    return str.replaceAll("&#40;", "(")
        .replaceAll("&#41;", ")")
        .replaceAll("&#39;", "'")
        .replaceAll("&lt;", "<")
        .replaceAll("&gt;", ">");
  }

  static String makeMainArtListURL(String email, String artImgFilename){
    return "https://www.gallery360.co.kr/artimage/${email}/art/preview/${artImgFilename}.jpg";
  }

  static String addComma(double price){
    var f = NumberFormat('###,###,###,###');
    return f.format(price);
  }

  static String addComma2(int price){
    var f = NumberFormat('###,###,###,###');
    return f.format(price);
  }

  static void WLine(){
    print("=============================================================");
  }
}

class cacheImage extends StatelessWidget {
  cacheImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.childtext, this.bordertext, this.boxshadow,
  });

  final String url;
  final double? width;
  final double? height;
  final Widget? childtext;
  final Border? bordertext;
  final BoxShadow? boxshadow;

  final CacheManager cacheManager = CacheManager(
      Config(
          'images_Key',
          maxNrOfCacheObjects: 100,
          stalePeriod: const Duration(days: 7)
      )
  );

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheManager: cacheManager,
      fadeInDuration: const Duration(milliseconds: 100),
      key: UniqueKey(),
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: bordertext,
            boxShadow: boxshadow != null ? [boxshadow!] : null,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        child: childtext,
      ),
      //아래를 돌리면 더 느려 보여서 주석처리한다.
      // placeholder: (context, url) => const Center(
      //   child: CircularProgressIndicator(),
      // ),
      errorWidget: (context, url, error) => Container(
        width: double.infinity,
        height: 300,
        color: Colors.grey.withOpacity(0.6),
        alignment: Alignment.center,
        child: const Text("No Image file."),
      ),
    );
  }
}



class cacheImageOnly extends StatelessWidget {
  cacheImageOnly({
    super.key,
    required this.url,
    this.width,
    this.height,
  });
  final String url;
  final double? width;
  final double? height;
  final CacheManager cacheManager = CacheManager(
      Config(
          'images_Key_Only',
          maxNrOfCacheObjects: 100,
          stalePeriod: const Duration(days: 7)
      )
  );

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheManager: cacheManager,
      fadeInDuration: const Duration(milliseconds: 100),
      key: UniqueKey(),
      imageUrl: url,
      errorWidget: (context, url, error) => Container(
        width: double.infinity,
        height: height,
        color: Colors.grey.withOpacity(0.6),
        alignment: Alignment.center,
        child: const Text("No Image file."),
      ),
    );
  }
}
