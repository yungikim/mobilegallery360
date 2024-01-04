import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gallery360/util/web_view_page.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:linkify/linkify.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/const.dart';
import '../pages/search/search_main.dart';

class Util {
  static late double fSize12;
  static late double fSize13;
  static late double fSize14;
  static late double fSize15;
  static late double fSize16;
  static late double fSize18;
  static late double fSize20;
  static late double fSize22;
  static late double fSize25;
  static late double fSize28;

  static fontSetting(BuildContext context){
    fSize12 = ResponsiveBreakpoints.of(context).isDesktop ? 16 : 12;
    fSize13 = ResponsiveBreakpoints.of(context).isDesktop ? 18 : 13;
    fSize14 = ResponsiveBreakpoints.of(context).isDesktop ? 20 : 14;
    fSize15 = ResponsiveBreakpoints.of(context).isDesktop ? 22 : 15;
    fSize16 = ResponsiveBreakpoints.of(context).isDesktop ? 25 : 16;
    fSize18 = ResponsiveBreakpoints.of(context).isDesktop ? 28 : 18;
    fSize20 = ResponsiveBreakpoints.of(context).isDesktop ? 30 : 20;
    fSize22 = ResponsiveBreakpoints.of(context).isDesktop ? 33 : 22;
    fSize25 = ResponsiveBreakpoints.of(context).isDesktop ? 36 : 25;
    fSize28 = ResponsiveBreakpoints.of(context).isDesktop ? 40 : 28;

  }

  static String chageText(String str) {
    return str
        .replaceAll("&#40;", "(")
        .replaceAll("&#41;", ")")
        .replaceAll("&#39;", "'")
        .replaceAll("&lt;", "<")
        .replaceAll("&gt;", ">")
        .replaceAll("<br />", "\n");
  }

  Future<void> URLOpen(LinkableElement link) async {
    if (!await launchUrl(Uri.parse(link.url))) {
      throw Exception('Could not launch ${link.url}');
    }
  }

  static void UrlOpen(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch ${url}');
    }
  }

  static void UrlOpenWebview(String url, String title) async {
    Get.to(
        () => WebViewPage(
              url: url,
              title: title,
            ),
        transition: Transition.rightToLeft);
    // if (!await launchUrl(Uri.parse(url))) {
    //   throw Exception('Could not launch ${url}');
    // }
  }

  static String makeMainArtListURL(String email, String artImgFilename) {
    return "$base_url/artimage/${email}/art/preview/${artImgFilename}.jpg";
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

  static String VrUrl(String dockey) {
    //glass_y@naver.com_20200709134801_8TOWJSK
    String id = dockey.split("@")[0];
    String sub = dockey.split("@")[1];
    String email = id + "@" + sub.split("_")[0];
    var url = "${base_url}/vr/vr/vrgallery/${email}/${dockey}/pano_f.jpg";
    return url;
  }

  static String extractEmail(String dockey) {
    String id = dockey.split("@")[0];
    String sub = dockey.split("@")[1];
    String email = id + "@" + sub.split("_")[0];
    return email;
  }

  static String changeDate(String str) {
    DateTime dt = DateTime.parse(str);
    final DateFormat formatter = DateFormat("yyyy-MM-dd");
    final String formatted = formatter.format(dt);
    return formatted;
  }
}

//이미지 캐쉬를 활용하여 컨테인에 표시하는 경우에 사용한다.
class cacheImage extends StatelessWidget {
  cacheImage(
      {super.key,
      required this.url,
      this.width,
      this.height,
      this.childtext,
      this.bordertext,
      this.boxshadow,
      this.colorFilter,
      this.margin});

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


class cacheImage_artist extends StatelessWidget {
  cacheImage_artist(
      {super.key,
        required this.url,
        this.width,
        this.height,
        this.childtext,
        this.bordertext,
        this.boxshadow,
        this.colorFilter,
        this.margin});

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
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
            border: bordertext,
            boxShadow: boxshadow != null ? [boxshadow!] : null,
            image: DecorationImage(
              image: NetworkImage(url.replaceAll("photo_profile", "photo_list")),
              fit: BoxFit.cover,
              colorFilter: colorFilter,
            )),
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
    title: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: GestureDetector(
        onTap: () {
          //에러 발생하네 다시 생각해 봐야 함
          // Get.to(() => Gallery360Main(), transition: Transition.fade,  preventDuplicates: false);
        },
        child: const Image(
          image: AssetImage("assets/images/logo/logo.png"),
          width: 130,
        ),
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

Widget actionButton() {
  return GestureDetector(
    onTap: (){
      String url = "$base_url/main/myspace.jsp";
      Util.UrlOpenWebview(url, "내공간에 작품 걸어보기");
    },
    child: Container(
      height: 80,
      width: 80,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage("assets/images/mainPage/btn_circle_deco.png"),
            fit: BoxFit.cover,
          )),
    ),
  );
}

void myspace(){
  String url = "$base_url/main/myspace.jsp";
  Util.UrlOpenWebview(url, "내공간에 작품 걸어보기");
}


Future openFile({required String url, String? fileName}) async{
  final file = await downloadFile(url, fileName!);
  if (file == null){
    return;
  }
  print('Path : ${file.path}');
  final result = await OpenFile.open(file.path);
  print("${result.type} / ${result.message}");

}

//Download file into private folder not visible to user
Future<File?> downloadFile(String url, String name) async{
  try{
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: const Duration(minutes: 100000),
        )
    );

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
  }catch(e){
    return null;
  }

}