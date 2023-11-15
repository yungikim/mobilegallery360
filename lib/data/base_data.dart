import 'package:flutter/material.dart';
import '../../../core/const.dart';

final List<String> imageList =[
  'https://www.gallery360.co.kr/img/main_banner/main_banner_welcome.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_artist.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_rental_01.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_curie.jpg',
  'https://www.gallery360.co.kr/img/main_banner/renewal.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_trial.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_dbook.jpg',
  'https://www.gallery360.co.kr/img/main_banner/main_banner_mypalce.jpg',
];

final List<String> mainMessage =[
  '전시에 대한 새로운 생각',
  '갤러리360 작가 모집',
  'VR갤러리도 빌려쓰세요',
  '전시에 대한 새로운 생각 4',
  '전시에 대한 새로운 생각 5',
  '전시에 대한 새로운 생각 6',
  '전시에 대한 새로운 생각 7',
  '전시에 대한 새로운 생각 8',
];

final List<String> mainMessage_sub =[
  '디지털 전시의 기획자와 관람객\n모두를 위한 새로운 경험을 제공합니다.',
  '갤러리360와 함께 새로운 전시 문화를\n선도해 나갈 작가님을 모십니다.',
  '세상에서 가장 쉽고, 직관적인 방법으로\nVR전시를 대관할 수 있습니다.',
  '전시에 대한 새로운 생각 4',
  '전시에 대한 새로운 생각 5',
  '전시에 대한 새로운 생각 6',
  '전시에 대한 새로운 생각 7',
  '전시에 대한 새로운 생각 8',
];

final List<String> mainMessage_btn_title =[
  '소개 영상 보기',
  '작가 등록 하기',
  '전시에 대한 새로운 생각 3',
  '전시에 대한 새로운 생각 4',
  '전시에 대한 새로운 생각 5',
  '전시에 대한 새로운 생각 6',
  '전시에 대한 새로운 생각 7',
  '전시에 대한 새로운 생각 8',
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
