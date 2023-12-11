import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../../main.dart';
import '../../../art/art_detail.dart';
import 'models/data_model.dart';
import '../../../../util/Util.dart';

void main() {
  HttpOverrides.global =
      MyHttpOverrides(); //Network.Image, Http로 ReverseProxy형태의 호출시 SSL에러 처리
  runApp(MM());
}

class MM extends StatelessWidget {
  const MM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MainArtList(),
      ),
    );
  }
}

class MainArtList extends StatefulWidget {
  const MainArtList({super.key});

  @override
  State<MainArtList> createState() => _MainArtListState();
}

class _MainArtListState extends State<MainArtList> {
  final DataController _dataController = Get.put(DataController());

  @override
  void initState() {
    // _dataController.getArtImage();
    checkMainImage();
    // TODO: implement initState
    super.initState();
  }

  void checkMainImage() {
    //print("checkMainImage");
    //_dataController.firstPageArtData.value = <DataModel>[];
    _dataController.getFirstPageArtDataCallDio().then((value) {
      _dataController.firstPageArtData.value = value;

      DataModel dm = _dataController.firstPageArtData.value[0];
      _dataController.mainPageRecommandImageURL.value =
          Util.makeMainArtListURL(dm.email, dm.artImgFilename);
      _dataController.mainPageRecommandImageTitle.value = dm.artTitle;
      _dataController.mainPageRecommandImageDockey.value = dm.dockey;
      _dataController.mainPageRecommandImageArtist.value = dm.artArtist;

      //데이터 로딩이 완료 되었음을 설정한다.
      _dataController.artListInit.value = true;
    });
  }

  @override
  build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    var f = NumberFormat('###,###,###,###');

    return Obx(() {
      if (_dataController.artListInit.value) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: InkWell(
                onTap: () {
                  Get.to(
                    () => ArtDetailPage(
                        dockey:
                            _dataController.mainPageRecommandImageDockey.value),
                    transition: Transition.rightToLeft,
                  );
                },
                child: CachedNetworkImage(
                  width: width * 0.70,
                  imageUrl: _dataController.mainPageRecommandImageURL.value
                      .toString(),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              width: width,
              //   color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      Util.chageText(
                          _dataController.mainPageRecommandImageTitle.value),
                      style: const TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _dataController.mainPageRecommandImageArtist.value,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Get.to(
                            () => ArtDetailPage(
                                dockey: _dataController
                                    .mainPageRecommandImageDockey.value),
                            transition: Transition.fadeIn);
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          side: const BorderSide(color: Colors.black)),
                      child: const Text(
                        "작품보기",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: ResponsiveBreakpoints.of(context).isMobile
                  ? width
                  : width * 0.9,
              child: MasonryGridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _dataController.firstPageArtData.value.length,
                crossAxisCount:
                    ResponsiveBreakpoints.of(context).isMobile ? 2 : 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container();
                  }
                  DataModel dm = _dataController.firstPageArtData.value[index];
                  String url =
                      Util.makeMainArtListURL(dm.email, dm.artImgFilename);
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ArtDetailPage(dockey: dm.dockey),
                          transition: Transition.rightToLeft);
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffe0e0e0)),
                          ),
                          child: Column(
                            children: [
                              cacheImageOnly(
                                url: url,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width *
                                          (ResponsiveBreakpoints.of(context)
                                                  .isMobile
                                              ? 0.25
                                              : 0.2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Util.chageText(dm.artTitle),
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          Text(dm.artArtist),
                                          Text(
                                            "${dm.artHeight} X ${dm.artWidth} ${dm.artHosu != null ? "(${dm.artHosu})호" : ''}",
                                            style: const TextStyle(
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 30.0,
                                      height: 20.0,
                                      //  padding: EdgeInsets.zero,
                                      //  color: Colors.red,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.favorite_outline,
                                            color: Colors.grey,
                                          )),
                                    ),
                                    //SizedBox.shrink(),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10.0,
                                    bottom: 10.0,
                                    right: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₩ ${f.format(dm.artPrice)}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Visibility(
                                          visible: dm.vrinfo != null,
                                          child: const Icon(
                                              Icons.smart_display_outlined),
                                        ),
                                        const Icon(Icons.vrpano_outlined)
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                },
              ),
            ),
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
