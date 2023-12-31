import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/models/vr_model.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../../util/Util.dart';

class VRList extends StatefulWidget {
  const VRList({super.key});

  @override
  State<VRList> createState() => _VRListState();
}

class _VRListState extends State<VRList> {
  int _current = 0;
  final DataController _dataController = Get.put(DataController());
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    checkVR();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void checkVR() {
    _dataController.getVrListDataCallDio().then((value) {
      _dataController.vrListData.value = value;
      for (int i = 0; i < _dataController.vrListData.value.length; i++) {
        VRModel vr = _dataController.vrListData.value[i];
        if (vr.email != null) {
          _dataController.emails.add(vr.email.toString());
          _dataController.dockeys.add(vr.dockey.toString());
          String url =
              "https://www.gallery360.co.kr/vr/vr/vrgallery/${vr.email}/${vr.dockey}/pano_f.jpg";
          _dataController.imageURLs.add(url);
        }
      }
      _dataController.vrListInit.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_dataController.vrListInit.value) {
        return Column(
          children: [
            CarouselSlider(
              items: _dataController.vrListData
                  .map((e) => Container(
                        //height: 400.0,
                        //width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            //  borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
                              image: NetworkImage(
                                  "$base_url/vr/vr/vrgallery/${e.email}/${e.dockey}/pano_f.jpg"),
                              fit: BoxFit.cover,
                            )),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 20.0,
                              left: 15.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Util.chageText(e.title.toString()),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1.0, 0.0),
                                          blurRadius: 3,
                                          color: Colors.black,
                                        )
                                      ]
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "${e.nickname}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1.0, 0.0),
                                          blurRadius: 3.0,
                                          color: Colors.black,
                                        )
                                      ]
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.dataset_linked,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(1.0, 0.0),
                                            blurRadius: 3,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${e.read}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              offset: Offset(1, 0),
                                              blurRadius: 3,
                                              color: Colors.black,
                                            )
                                          ]
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(1.0, 0.0),
                                            blurRadius: 3,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${e.like}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              offset: Offset(1.0, 0.0),
                                              blurRadius: 3,
                                              color: Colors.black,
                                            )
                                          ]
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
              carouselController: _carouselController,
              options: CarouselOptions(
                height: ResponsiveBreakpoints.of(context).isMobile ? 250 : 350,
                autoPlay: true,
                viewportFraction: ResponsiveBreakpoints.of(context).isMobile ? 1.0 :  0.6,
                autoPlayInterval: const Duration(seconds: 10),
                onPageChanged: (index, reaseon){
                  _dataController.vrcurrentItem.value = index;
                },
             //   aspectRatio: 1.5,
                //    enlargeCenterPage: true,   //가운데 만 조금 커지는 옵션
                // enlargeStrategy:
                //     CenterPageEnlargeStrategy.zoom, //높이가 동일한 이미지로 표시하는 옵션
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _dataController.imageURLs.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    _carouselController.animateToPage(entry.key);

                    _dataController.vrcurrentItem.value = entry.key;

                  },
                  child: Obx(
                    ()=> Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_dataController.vrcurrentItem.value == entry.key ? 0.9 : 0.4)),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
