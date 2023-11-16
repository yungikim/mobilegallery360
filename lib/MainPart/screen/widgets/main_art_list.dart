import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:intl/intl.dart';
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
  final DataController _dataController = DataController();

  @override
  void initState() {
    print("111111");
    _dataController.getFirstPageArtDataCallDio();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    var f = NumberFormat('###,###,###,###');

    return MasonryGridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: _dataController.firstPageArtData.length,
      crossAxisCount: 2,
      itemBuilder: (context, index) {
        DataModel dm = _dataController.firstPageArtData[index];
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
                    //   imageProvider.rea
                    //   return Container(
                    //     height: 200,
                    //     width: 100,
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         image: imageProvider,
                    //         fit: BoxFit.fitHeight,
                    //       ),
                    //     ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: width * 0.30,
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
                              Row(
                                children: [
                                  Text("${dm.artHeight} X ${dm.artWidth}"),
                                  Visibility(
                                    visible: dm.artHosu != null,
                                    child: Text("(${dm.artHosu})호"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_outline,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₩ ${f.format(dm.artPrice)}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: dm.vrinfo != null,
                              child: Icon(Icons.smart_display_outlined),
                            ),
                            Icon(Icons.vrpano_outlined)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
