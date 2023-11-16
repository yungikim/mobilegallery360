import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:gallery360/MainPart/screen/widgets/main_art_list.dart';
import 'package:gallery360/MainPart/screen/widgets/main_carousel.dart';
import 'package:gallery360/MainPart/screen/widgets/main_recommand_image.dart';
import 'package:gallery360/MainPart/screen/widgets/models/vr_model.dart';
import 'package:gallery360/MainPart/screen/widgets/vr_list.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:gallery360/MainPart/screen/widgets/models/data_model.dart';
import '../../data/base_data.dart';

import '../../core/const.dart';
import '../../util/Util.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final DataController _dataController = Get.put(DataController());

  @override
  void initState() {
    // TODO: implement initState
    // checkMainImage();
    super.initState();
  }

  // void checkMainImage(){
  //   _dataController.getFirstPageArtDataCallDio().then((value){
  //     _dataController.firstPageArtData.value = value;
  //     //for (var i = 0 ; i < _dataController.firstPageArtData.value.length; i++){
  //     DataModel dm = _dataController.firstPageArtData[0];
  //     _dataController.mainPageRecommandImageURL.value = Util.makeMainArtListURL(dm.email, dm.artImgFilename);
  //     _dataController.mainPageRecommandImageTitle.value = dm.artTitle;
  //     _dataController.mainPageRecommandImageDockey.value = dm.dockey;
  //     _dataController.mainPageRecommandImageArtist.value = dm.artArtist;
  //     //}
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {},
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
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: MainCarouselWidget(),
            ),
            const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    CenterText1(
                      title1: "당신이 만나는 새로운 전시",
                      title2: "VR 갤러리",
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                )),
            const SliverToBoxAdapter(
                 child: VRList(),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(
                  height: 30.0,
                ),
                const CenterText1(
                  title1: "당신이 만나는 새로운 작품",
                  title2: "추천 작품",
                ),
            //    const MainRecommandImage(),
                const SizedBox(
                  height: 30.0,
                ),
                const SizedBox(
                  height: 0.0,
                ),
                  const MainArtList(),
              ]),
            ),
            // SliverToBoxAdapter(
            //   child: const MainRecommandImage(),
            // )
          ],
        ),
      );
    }


  // }
 }


class CenterText1 extends StatefulWidget {
  const CenterText1({super.key, required this.title1, required this.title2});

  final String title1;
  final String title2;

  @override
  State<CenterText1> createState() => _CenterText1State();
}

class _CenterText1State extends State<CenterText1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title1,
          style: const TextStyle(fontSize: 15.0),
        ),
        Text(
          widget.title2,
          style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
