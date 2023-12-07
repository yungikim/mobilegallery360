import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/const.dart';
import '../util/video_player.dart';

final List<String> imageList2 =[
  'https://www.gallery360.co.kr/img/main_banner/main_banner_welcome.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_artist.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_rental_01.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_curie.jpg',
  'https://www.gallery360.co.kr/img/main_banner/renewal.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_trial.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_dbook.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_mypalce.jpg',
];

final List<String> imageList =[
  'assets/images/mainPage/banner/main_banner_welcome.jpg',
  'assets/images/mainPage/banner/main_banner_artist.jpg',
  'assets/images/mainPage/banner/main_banner_rental_01.jpg',
  'assets/images/mainPage/banner/main_banner_curie.jpg',
  'assets/images/mainPage/banner/renewal.jpg',
  'assets/images/mainPage/banner/main_banner_trial.jpg',
  'assets/images/mainPage/banner/main_banner_dbook.jpg',
  'assets/images/mainPage/banner/main_banner_mypalce.jpg',
];

final List<String> mainMessage =[
  '전시에 대한\n새로운 생각',
  '갤러리360\n작가 모집',
  'VR갤러리도\n빌려쓰세요',
  '큐리야~~\n그림을 부탁해!',
  'VR 전시 서비스\n\n리뉴얼사이트 오픈',
  '대관서비스\n궁금하시죠?',
  '디지털 출판\nD-Book',
  '내 공간에 작품 걸기',
];

final List<String> mainMessage_sub =[
  '디지털 전시의 기획자와 관람객\n모두를 위한 새로운 경험을 제공합니다.',
  '갤러리360와 함께 새로운 전시 문화를\n선도해 나갈 작가님을 모십니다.',
  '세상에서 가장 쉽고, 직관적인 방법으로\nVR전시를 대관할 수 있습니다.',
  '인공지능화가 큐리는 대가의 화풍을 학습\n세상 하나 뿐인 작품을 그려줍니다.',
  '더 다양한 기능을 더 풍부한 전시를\nVR전시 서비스 리뉴얼 사이트에서\n경헝해 보세요',
  '앞서 나가는 온라인 전시 솔루션\nVR갤러리 하루 동안 경험해 보고\n선택하세요',
  '효과적인 디지털 마케팅\nD-Book으로 고민은 그만',
  '상상만 하지 마세요!\n당신의 공간에 작품을 미리 걸어 보세요',
];

final List<String> mainMessage_btn_title =[
  '소개 영상 보기',
  '작가 등록 하기',
  '자세히 알아보기',
  'AI페인터로 그려보기',
  '자세히 알아보기',
  '무료체험 신청하기',
  'D-Book 알아보기',
  '작품 걸어보기',
];

final List<String> mainMessage_btn_url =[
  'video',
  'regart',
  'vrshow',
  'aipainter',
  'detail',
  'free',
  'dbook',
  'show_myroom',
];


final List<Color> mainMessage_btn_color =[
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
      print("소개영상 보기");
      String url = "https://www.gallery360.co.kr/intro/gallery360_kr_web.mp4";
      Get.to(() => VideoPlayerShow(videoUrl: url,));
    },
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 1.0,
        )),
    child: const Text("소개 영상 보기", style: TextStyle(color: Colors.white),),
    ),

  OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 1.0,
        )),
    child: const Text("작가 등록 하기", style: TextStyle(color: Colors.white),),
  ),

  OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Color(0xff4af5d4),
          width: 1.0,
        )),
    child: const Text("자세히 알아보기", style: TextStyle(color: Color(0xff4af5d4)),),
  ),

  OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 1.0,
        )),
    child: const Text("AI페인터로 그려보기", style: TextStyle(color: Colors.white),),
  ),

  OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 1.0,
        )),
    child: const Text("자세히 알아보기", style: TextStyle(color: Colors.white),),
  ),

  OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 1.0,
        )),
    child: const Text("무료체험 신청하기", style: TextStyle(color: Colors.white),),
  ),

  OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Colors.black,
          width: 1.0,
        )),
    child: const Text("D-Book 알아보기", style: TextStyle(color: Colors.white),),
  ),

  OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(0.0),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 1.0,
        )),
    child: const Text("작품 걸어보기", style: TextStyle(color: Colors.white),),
  ),
];



final SlideController _slideController = SlideController();

final List<Widget> imageSliders = imageList.map(
        (item) => Container(
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
                  )
              ),
            ),
            // Image.network(item, fit: BoxFit.cover, width:200, height: 200,),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${mainMessage[imageList.indexOf(item)]}",style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold)),
                    //Text("22222222222",style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            )
            // Positioned(
            //   bottom: 0.0,
            //   left: 0.0,
            //   right: 0.0,
            //   child: Container(
            //     decoration: const BoxDecoration(
            //         gradient: LinearGradient(
            //           colors: [
            //             Color.fromARGB(200,0,0,0),
            //             Color.fromARGB(0, 0, 0, 0),
            //           ],
            //           begin: Alignment.bottomCenter,
            //           end: Alignment.topCenter,
            //         )
            //     ),
            //     padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            //     child: Text(
            //       //'No. ${imageList.indexOf(item)} image',
            //       "${mainMessage[imageList.indexOf(item)]}",
            //       style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    )
).toList();
