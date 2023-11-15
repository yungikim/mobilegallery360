import 'package:flutter/material.dart';

import '../../../core/const.dart';

final List<String> imageList2 =[
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

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
  '전시에 대한 새로운 생각 1',
  '전시에 대한 새로운 생각 2',
  '전시에 대한 새로운 생각 3',
  '전시에 대한 새로운 생각 4',
  '전시에 대한 새로운 생각 5',
  '전시에 대한 새로운 생각 6',
  '전시에 대한 새로운 생각 7',
  '전시에 대한 새로운 생각 8',
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
