
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/main_art_list.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/main_carousel.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/main_monthly_artist.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/main_vrshowlist.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/spacebar1.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/spacebar2.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/spacebar3.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/spacebar4.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/spacebar5.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/spacebar6.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/spacebarBottom.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/vr_list2.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../search/search_main.dart';

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

  @override
  Widget build(BuildContext context) {
    _dataController.isMobile.value = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              if (ZoomDrawer.of(context)!.isOpen()){
                ZoomDrawer.of(context)!.close();
              }else{
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
                  Get.to(() => const SearchBarScreen(), transition: Transition.fadeIn);
                },
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
                 child: VRList2(),
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
                const SizedBox(
                  height: 30.0,
                ),
                const SizedBox(
                  height: 0.0,
                ),
                const MainArtList(),
                const SizedBox(height: 50.0,),
                const Spacebar1(),
                const SizedBox(height: 70.0,),
                const MonthlyArtistWidget(),
                const SizedBox(height: 70.0,),
                const Spacebar2(),
                const SizedBox(height: 70.0,),
                const Spacebar3(),
                const SizedBox(height: 20.0,),
                const VrShowList(),
                const SizedBox(height: 70,),
                const SpaceBar4(),
                const SizedBox(height: 70,),
                const SpaceBar5(),
                const SizedBox(height: 30,),
                const SpaceBar6(),
                const SizedBox(height: 10,),
                const SpacebarBottom(),
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
