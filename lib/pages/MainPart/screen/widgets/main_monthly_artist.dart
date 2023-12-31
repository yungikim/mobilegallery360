import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:gallery360/util/Util.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
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
                            bottom: ResponsiveBreakpoints.of(context).isDesktop ? 60.0 : 60.0,
                            left: 20.0,
                            child: Text(
                              "${item.nickname} | ${item.nameEng}",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: Util.fSize14
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10.0,
                            left: 20.0,
                            child: InkWell(
                              onTap: (){
                                Get.to(() => ArtistDetailPage(email: item.email), transition: Transition.rightToLeft);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                // width: 120,
                                // height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Text(
                                  tr('main_32'),
                                  style: TextStyle(
                                    fontSize: Util.fSize14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],),
      )).toList(),

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
