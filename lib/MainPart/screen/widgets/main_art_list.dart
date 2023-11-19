import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../main.dart';
import 'models/data_model.dart';
import '../../../util/Util.dart';

void main() {
  HttpOverrides.global =
      MyHttpOverrides(); //Network.Image, Http로 ReverseProxy형태의 호출시 SSL에러 처리
  runApp(MM());
}

class MM extends StatelessWidget {
  const MM({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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


  void checkMainImage(){
    print("checkMainImage");
    //_dataController.firstPageArtData.value = <DataModel>[];
    _dataController.getFirstPageArtDataCallDio().then((value){
      _dataController.firstPageArtData.value = value;

      DataModel dm = _dataController.firstPageArtData.value[0];
      _dataController.mainPageRecommandImageURL.value = Util.makeMainArtListURL(dm.email, dm.artImgFilename);
      _dataController.mainPageRecommandImageTitle.value = dm.artTitle;
      _dataController.mainPageRecommandImageDockey.value = dm.dockey;
      _dataController.mainPageRecommandImageArtist.value = dm.artArtist;

      //데이터 로딩이 완료 되었음을 설정한다.
      _dataController.artListInit.value = true;
    });
  }


  @override
  build(BuildContext context){

    final double width = MediaQuery.of(context).size.width;
    var f = NumberFormat('###,###,###,###');

    return Obx((){
      if (_dataController.artListInit.value){
        return  Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(88.0),
                child:  CachedNetworkImage(
                   imageUrl: _dataController.mainPageRecommandImageURL.value.toString(),
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  // imageBuilder: (context, imageProvider){
                  //    return Container(
                  //      decoration: BoxDecoration(
                  //        image: DecorationImage(
                  //          image: CachedNetworkImageProvider(_dataController.mainPageRecommandImageURL.value.toString()),
                  //        )
                  //      ),
                  //    );
                  // },
                  //imageUrl:  'https://www.gallery360.co.kr/artimage/kimjiyoun72@naver.com/art/preview/kimjiyoun72@naver.com_b8a1d8f684a9dcd8d28a995eb37adb39.7021844.jpg?open&ver=1700114846568?open&ver=1602322826950',
                ),
              ),
              MasonryGridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _dataController.firstPageArtData.value.length,
                crossAxisCount: ResponsiveBreakpoints.of(context).isMobile ? 2 : 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container();
                  }
                  DataModel dm = _dataController.firstPageArtData.value[index];
                  String url = Util.makeMainArtListURL(dm.email, dm.artImgFilename);
                  return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffe0e0e0)),
                        ),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: url,
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              // imageBuilder: (context, imageProvider){
                              //   return Container(
                              //     decoration: BoxDecoration(
                              //       image: DecorationImage(
                              //         image: CachedNetworkImageProvider(url),
                              //       )
                              //     ),
                              //     height: 200,
                              //     width: 100,
                              //     // decoration: BoxDecoration(
                              //     //   image: DecorationImage(
                              //     //     image: imageProvider,
                              //     //     fit: BoxFit.fitHeight,
                              //     //   ),
                              //     // ),
                              //   );
                              // },
                            ),
                            // Image.network(
                            //   url,
                            //   fit: BoxFit.cover,
                            // ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * (ResponsiveBreakpoints.of(context).isMobile ? 0.25 : 0.2),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "₩ ${f.format(dm.artPrice)}",
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Visibility(
                                        visible: dm.vrinfo != null,
                                        child: const Icon(Icons.smart_display_outlined),
                                      ),
                                      const Icon(Icons.vrpano_outlined)
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
                },
              ),
            ],


        );
      }else{
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });


  }
}
