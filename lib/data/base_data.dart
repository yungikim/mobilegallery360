import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/dbook/dbook_main.dart';
import 'package:gallery360/util/Util.dart';
import 'package:gallery360/util/web_view_page.dart';
import 'package:get/get.dart';
import '../../../core/const.dart';
import '../util/video_show.dart';

final List<String> imageList2 = [
  'https://www.gallery360.co.kr/img/main_banner/main_banner_welcome.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_artist.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_rental_01.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_curie.jpg',
  'https://www.gallery360.co.kr/img/main_banner/renewal.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_trial.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_dbook.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_mypalce.jpg',
];

final List<String> imageList = [
  'assets/images/mainPage/banner/main_banner_welcome.jpg',
  'assets/images/mainPage/banner/main_banner_artist.jpg',
  'assets/images/mainPage/banner/main_banner_rental_01.jpg',
  'assets/images/mainPage/banner/main_banner_curie.jpg',
  'assets/images/mainPage/banner/renewal.jpg',
  'assets/images/mainPage/banner/main_banner_trial.jpg',
  'assets/images/mainPage/banner/main_banner_dbook.jpg',
  'assets/images/mainPage/banner/main_banner_mypalce.jpg',
];

final List<String> mainMessage = [
  tr('main_1'),
  tr('main_2'),
  tr('main_3'),
  tr('main_4'),
  tr('main_5'),
  tr('main_6'),
  tr('main_7'),
  tr('main_8'),
];

final List<String> mainMessage_sub = [
  tr('main_9'),
  tr('main_10'),
  tr('main_11'),
  tr('main_12'),
  tr('main_13'),
  tr('main_14'),
  tr('main_15'),
  tr('main_16'),
];

final List<String> mainMessage_btn_title = [
  tr('main_17'),
  '작가 등록 하기',
  '자세히 알아보기',
  'AI페인터로 그려보기',
  '자세히 알아보기',
  '무료체험 신청하기',
  'D-Book 알아보기',
  '작품 걸어보기',
];

final List<String> mainMessage_btn_url = [
  'video',
  'regart',
  'vrshow',
  'aipainter',
  'detail',
  'free',
  'dbook',
  'show_myroom',
];

final List<Color> mainMessage_btn_color = [
  Colors.white,
  Colors.white,
  const Color(0xff4af5d4),
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
];

final List<Widget> main_btn_widget = [
  OutlinedButton(
    onPressed: () {

      String url =
          "${base_url}/intro/gallery360_kr_web.mp4"; //x-frame-options Gallery360서버가 막아 놓았음
      String url2 =
          "https://meet.kmslab.com:8444/WMeet/FDownload.do?id=6571cd8c7be62549e657347c&ty=1";
      Get.to(
          () => VideoShow(
                url: url2,
                title: tr('main_25'),
              ),
          transition: Transition.fadeIn);
    },
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 1.0,
        )),
    child: Text(
      tr('main_17'),
      style: TextStyle(color: Colors.white, fontSize: Util.fSize16),
    ),
  ),
  const SizedBox(),
  OutlinedButton(
    onPressed: () {
      Get.to(
          () => const WebViewPage(
                url: 'https://exhibit.gallery360.co/',
                title: "",
              ),
          transition: Transition.fade);
    },
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Color(0xff4af5d4),
          width: 1.0,
        )),
    child: Text(
      tr('main_19'),
      style: TextStyle(color: Color(0xff4af5d4), fontSize: Util.fSize16),
    ),
  ),
  const SizedBox(),
  OutlinedButton(
    onPressed: () {
      String url = "$base_url/main/news/main_news_mobile.jsp?bun=150";
      Util.UrlOpenWebview(url, tr('main_26'));
    },
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 1.0,
        )),
    child: Text(
      tr('main_19'),
      style: TextStyle(color: Colors.white, fontSize: Util.fSize16),
    ),
  ),
  const SizedBox(),
  OutlinedButton(
    onPressed: () {
    //  String url = "$base_url/main/news/main_news_mobile.jsp?bun=65";
    //  Util.UrlOpenWebview(url, "D-BOOK 서비스 소개");
      Get.to(() => const dbookService(), transition: Transition.rightToLeft);
    },
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Colors.black,
          width: 1.0,
        )),
    child: Text(
      tr('main_23'),
      style: TextStyle(color: Colors.white, fontSize: Util.fSize16),
    ),
  ),
  OutlinedButton(
    onPressed: () {
      myspace();
    },
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 1.0,
        )),
    child: Text(
      tr('main_24'),
      style: TextStyle(color: Colors.white, fontSize: Util.fSize16),
    ),
  ),
];

final SlideController _slideController = SlideController();

final List<Widget> imageSliders = imageList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: [
                Container(
                  height: 500,
                  width: 600,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(item),
                        fit: BoxFit.cover,
                      )),
                ),
                Image.network(item, fit: BoxFit.cover, width:200, height: 200,),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(mainMessage[imageList.indexOf(item)],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Util.fSize15,
                                fontWeight: FontWeight.bold)),
                        //Text("22222222222",style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ))
    .toList();
