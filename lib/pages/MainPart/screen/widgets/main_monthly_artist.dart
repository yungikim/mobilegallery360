import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:gallery360/util/Util.dart';
import 'package:get/get.dart';
import '../../../../Sample/carousel/sub/base_carousel.dart';
import '../../../artist/artist_detail.dart';

class MonthlyArtistWidget extends StatefulWidget {
  const MonthlyArtistWidget({super.key});

  @override
  State<MonthlyArtistWidget> createState() => _MonthlyArtistState();
}

class _MonthlyArtistState extends State<MonthlyArtistWidget> {
  final DataController _dataController = Get.put(DataController());

  @override
  void initState() {
    _dataController.getMonthlyArt();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _dataController.monthlyArtist
          .map((item) => cacheImage(
                url: "$base_url/artimage/${item.email}/photo_list/${item.email}_gray.jpg",
                childtext: Stack(
                        children: [
                          Positioned(
                            bottom: 48.0,
                            left: 10.0,
                            child: Text(
                              "${item.nickname} | ${item.nameEng}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10.0,
                            left: 10.0,
                            child: InkWell(
                              onTap: (){
                                Get.to(() => ArtistDetailPage(email: item.email), transition: Transition.rightToLeft);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 120,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                ),
                                child: const Text(
                                  "작가 만나러 가기",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],),
      )).toList(),
      // .map((item) => Container(
      //     width: double.infinity,
      //     decoration: BoxDecoration(
      //         border: Border.all(color: Colors.grey),
      //         image: DecorationImage(
      //           colorFilter: ColorFilter.mode(
      //             Colors.black.withOpacity(0.3),
      //             BlendMode.darken,
      //           ),
      //           image: NetworkImage(
      //               "https://www.gallery360.co.kr/artimage/${item.email}/photo_list/${item.email}_gray.jpg"),
      //           fit: BoxFit.cover,
      //         )),
      //     child: Stack(
      //       children: [
      //         Positioned(
      //           bottom: 48.0,
      //           left: 10.0,
      //           child: Text(
      //             "${item.nickname} | ${item.nameEng}",
      //             style: const TextStyle(
      //               fontWeight: FontWeight.w400,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //         Positioned(
      //           bottom: 10.0,
      //           left: 10.0,
      //           child: Container(
      //             alignment: Alignment.center,
      //             width: 120,
      //             height: 30,
      //             decoration: BoxDecoration(
      //               border: Border.all(color: Colors.white),
      //             ),
      //             child: const Text(
      //               "작가 만나러 가기",
      //               style: TextStyle(
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ),
      //         )
      //       ],
      //     )))
      // .toList(),
      options: CarouselOptions(
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 10),
      //  viewportFraction: 1,
      aspectRatio: 2.0,
      enlargeFactor: 0.2,
      enlargeCenterPage: true,
    ),);
  }
}

final List<Widget> MainArtists = imageList.map((item) => Container()).toList();
