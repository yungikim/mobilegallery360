import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/Sample/listview/data_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';

import '../../main.dart';
import '../../util/Util.dart';
import 'data_model.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MainP());
}

class MainP extends StatelessWidget {
  const MainP({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MPP(),
    );
  }
}

class MPP extends StatefulWidget {
  const MPP({super.key});

  @override
  State<MPP> createState() => _MPPState();
}

class _MPPState extends State<MPP> {
  final DataController _dataController = DataController();

  @override
  void initState() {
    // _dataController.getFirstPageArtData2();
    _dataController.getFirstPageArtDataCallDio();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    var f = NumberFormat('###,###,###,###');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Staggered Grid View"),
        ),
        body: Container(
            child: MasonryGridView.count(
          itemCount: _dataController.firstPageArtData.length,
          // crossAxisSpacing: 5,
          // mainAxisSpacing: 5,
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            DataModel dm = _dataController.firstPageArtData[index];
            String url =
                "https://www.gallery360.co.kr/artimage/${dm.email}/art/preview/${dm.artImgFilename}.jpg";
            return Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffe0e0e0)),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
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
                        padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("₩ ${f.format(dm.artPrice)}", style: TextStyle(fontWeight: FontWeight.bold),),
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
        )),
      ),
    );
  }
}
