import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/search/search_main.dart';

class Util {
  static String chageText(String str) {
    return str
        .replaceAll("&#40;", "(")
        .replaceAll("&#41;", ")")
        .replaceAll("&#39;", "'")
        .replaceAll("&lt;", "<")
        .replaceAll("&gt;", ">");
  }

  Future<void> URLOpen(LinkableElement link) async {
    if (!await launchUrl(Uri.parse(link.url))) {
      throw Exception('Could not launch ${link.url}');
    }
  }

  static void UrlOpen(String url) async{
    if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch ${url}');
    }
  }

  static String makeMainArtListURL(String email, String artImgFilename) {
    return "https://www.gallery360.co.kr/artimage/${email}/art/preview/${artImgFilename}.jpg";
  }

  static String addComma(double price) {
    var f = NumberFormat('###,###,###,###');
    return f.format(price);
  }

  static String addComma2(int price) {
    var f = NumberFormat('###,###,###,###');
    return f.format(price);
  }

  static void WLine() {
    print("=============================================================");
  }
}

//이미지 캐쉬를 활용하여 컨테인에 표시하는 경우에 사용한다.
class cacheImage extends StatelessWidget {
  cacheImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.childtext,
    this.bordertext,
    this.boxshadow, this.colorFilter, this.margin
  });

  final String url;
  final double? width;
  final double? height;
  final Widget? childtext;
  final Border? bordertext;
  final BoxShadow? boxshadow;
  final ColorFilter? colorFilter;
  final EdgeInsets? margin;


  final CacheManager cacheManager = CacheManager(Config('images_Key',
      maxNrOfCacheObjects: 100, stalePeriod: const Duration(days: 7)));

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheManager: cacheManager,
      fadeInDuration: const Duration(milliseconds: 1),
      key: UniqueKey(),
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
            border: bordertext,
            boxShadow: boxshadow != null ? [boxshadow!] : null,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: colorFilter,
            )),
        child: childtext,
      ),
      //아래를 돌리면 더 느려 보여서 주석처리한다.
      // placeholder: (context, url) => const Center(
      //   child: CircularProgressIndicator(),
      // ),
      placeholder: (context, url) => Container(
        height: height ?? 300,
      ),
      errorWidget: (context, url, error) => Container(
        width: double.infinity,
        height: height ?? 300,
        color: Colors.grey.withOpacity(0.6),
        alignment: Alignment.center,
        child: const Text("No Image file."),
      ),
    );
  }
}

//캐쉬이미지만 단독으로 사용한다.
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
  final CacheManager cacheManager = CacheManager(Config('images_Key_Only',
      maxNrOfCacheObjects: 100, stalePeriod: const Duration(days: 7)));

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheManager: cacheManager,
      fadeInDuration: const Duration(milliseconds: 100),
      key: UniqueKey(),
      imageUrl: url,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: height,
        color: Colors.grey.withOpacity(0.6),
        alignment: Alignment.center,
        child: const Text("No Image file."),
      ),
    );
  }
}

//AppBar를 공통으로 사용하기 위해서 템플릿화 한다.
Widget customAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.black,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        if (ZoomDrawer.of(context)!.isOpen()) {
          ZoomDrawer.of(context)!.close();
        } else {
          ZoomDrawer.of(context)!.open();
        }
      },
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
    ),
    title: const Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Image(
        image: AssetImage("assets/images/logo/logo.png"),
        width: 130,
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {
            Get.to(() => const SearchBarScreen(),
                transition: Transition.fadeIn);
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          )),
    ],
  );
}
