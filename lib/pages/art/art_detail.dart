import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/art/controller/art_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../util/Util.dart';

class ArtDetailPage extends StatefulWidget {
  const ArtDetailPage({super.key, required this.dockey});

  final String dockey;

  @override
  State<ArtDetailPage> createState() => _ArtDetailPageState();
}

class _ArtDetailPageState extends State<ArtDetailPage> {

  final ArtInfoController _artInfoController = Get.put(ArtInfoController());

  late String email = "";

  @override
  void initState() {
    _artInfoController.select_art_key.value = widget.dockey;
    email = widget.dockey.split("_")[0];
    _artInfoController.getArtInfo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
      ),
      body: Obx((){
        if (_artInfoController.dataLoadingComplete_artinfo.value){
          var item = _artInfoController.artinfo;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        height: 450,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("${base_url}/artimage/${item.email}/art/preview/${widget.dockey}.jpg"),
                                fit: BoxFit.fitHeight
                            )
                        ),
                      ),
                      const SizedBox(height: 15,),
                      const Text("작품 이미지에 대한 무단 도용 및 재배포를 금지합니다."),
                      Text("Copyright © ${item.artArtist}. All rights reserved."),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${item.artTitle}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                            const SizedBox(height: 15,),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      child: Text("작가명"),
                                    ),
                                    Text("${item.artArtist}")
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      child: Text("제작연도"),
                                    ),
                                    Text("${item.artDateYear}")
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      child: Text("장르"),
                                    ),
                                    Text("${item.artGenre}")
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      child: Text("재료"),
                                    ),
                                    Text("${item.artSource}")
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      child: Text("작품코드"),
                                    ),
                                    Text("${item.artkey}")
                                  ],
                                ),
                                const SizedBox(height: 15,),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("판매금액", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),),
                                    Row(
                                      children: [
                                        const Icon(Icons.access_time),
                                        const SizedBox(width: 10,),
                                        Text("${Util.addComma2(item.artPrice!)}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      })
    );
  }
}
