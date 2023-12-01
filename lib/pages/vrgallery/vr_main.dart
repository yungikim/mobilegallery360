import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/pages/vrgallery/controller/vrcontroller.dart';
import 'package:gallery360/pages/vrgallery/vr_detail.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../const/const.dart';
import '../../util/Util.dart';
import '../MainPart/screen/widgets/models/vr_model.dart';
import '../MainPart/screen/widgets/vr_list2.dart';

class VrMainPage extends StatefulWidget {
  VrMainPage({super.key});

  @override
  State<VrMainPage> createState() => _VrMainPageState();
}

class _VrMainPageState extends State<VrMainPage> {
  final VrController _vrController = Get.put(VrController());

  late final CarouselController _carouselController;
  late final CarouselController _carouselController2;
  int activeIndex = 0;

  @override
  void initState() {

    _carouselController = CarouselController();
    _carouselController2 = CarouselController();
    // TODO: implement initState
    super.initState();
  }

  Widget indicator() => Container(
    margin: const EdgeInsets.only(bottom: 20.0),
    alignment: Alignment.bottomCenter,
    child: Obx(
      ()=> AnimatedSmoothIndicator(
        activeIndex: _vrController.activeIndex.value,
        count : _vrController.mainvrs.length,
        onDotClicked: (index){
          _carouselController.animateToPage(index);
        } ,
        effect: JumpingDotEffect(
          dotHeight: 12,
          dotWidth: 12,
          activeDotColor: Colors.white,
          dotColor: Colors.white.withOpacity(0.4),
        ),
      ),
    ),
  );

  Widget indicator2() => Container(
    margin: const EdgeInsets.only(bottom: 20.0),
    alignment: Alignment.bottomCenter,
    child: Obx(
          ()=> AnimatedSmoothIndicator(
        activeIndex: _vrController.activeIndex2.value,
        count : _vrController.svrs.length,
        onDotClicked: (index){
          _carouselController2.animateToPage(index);
        } ,
        effect: JumpingDotEffect(
          dotHeight: 12,
          dotWidth: 12,
          activeDotColor: Colors.grey.withOpacity(0.9),
          dotColor: Colors.grey.withOpacity(0.4),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: customAppBar(context),
        ),
        body: CustomScrollView(
          slivers: [
            //최상단 케러셀 보기
            SliverToBoxAdapter(
              child: FutureBuilder(
                future: _vrController.MakeMainVrs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Obx(
                        ()=> CarouselSlider(
                          carouselController: _carouselController,
                            items: _vrController.mainvrs
                                .map(
                                  (item) => GestureDetector(
                                    onTap: (){
                                      Get.to(() => VrDetailPage(dockey: item.dockey), transition: Transition.rightToLeft);
                                    },
                                    child: cacheImage(
                                url: item.url,
                                width: double.infinity,
                                height: 600,
                                childtext: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        top: 120,
                                        //  left: 30,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              Util.chageText(item.space),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              Util.chageText(item.title),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                ),
                                colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.darken),
                              ),
                                  ),
                            )
                                .toList(),
                            options: CarouselOptions(
                              aspectRatio: 4 / 3,
                              viewportFraction: 1,
                              autoPlay: true,
                              onPageChanged: (index, reason){
                                  _vrController.activeIndex.value = index;
                              }
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: indicator(),
                        )
                      ],
                    );
                  } else {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Connection error"),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                },
              ),
            ),

            //추천 VR 갤러리 텍스트
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      "추천 VR 갤러리",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            //2번째 추천 VR Carousel
            SliverToBoxAdapter(
              child: FutureBuilder(
                future: _vrController.getMainVR(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    List<VRModel> list = snapshot.data;
                    return Column(

                      children: [
                         Obx(
                        ()=> CarouselSlider.builder(
                              carouselController: _carouselController2,
                              itemCount: _vrController.svrs.length,
                              itemBuilder: (context, index, realidx) {
                                VRModel item = list[index];
                                String url =
                                    "$base_url/vr/vr/vrgallery/${item.email}/${item.dockey}/pano_f.jpg";
                                return GestureDetector(
                                  onTap: (){
                                    Get.to(() => VrDetailPage(dockey: '${item.dockey}'), transition: Transition.rightToLeft);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: NetworkImage(url),
                                      fit: BoxFit.cover,
                                    )),
                                    child: CarouselInnerText(
                                      e: item,
                                    ),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                viewportFraction: 1.0,
                                aspectRatio: 5/3,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 8),
                                onPageChanged: (index, reason){
                                  _vrController.activeIndex2.value = index;
                                }
                              ),
                            ),
                         ),

                        Container(
                          height: 60,
                          alignment: Alignment.center,
                          child: indicator2(),
                        ),

                      ],
                    );
                  } else {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Connection Error"),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                },
              ),
            )
          ],
        ));
  }
}
