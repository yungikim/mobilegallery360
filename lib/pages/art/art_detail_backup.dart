import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/art/controller/art_controller.dart';
import 'package:gallery360/pages/artist/model/artist_detail.dart';
import 'package:get/get.dart';

import '../../util/Util.dart';
import '../artist/artist_detail.dart';
import 'model/art_detail.dart';
import 'model/art_in_artlist.dart';

class ArtDetailPage extends StatefulWidget {
  const ArtDetailPage({super.key, required this.dockey});

  final String dockey;

  @override
  State<ArtDetailPage> createState() => _ArtDetailPageState();
}

class _ArtDetailPageState extends State<ArtDetailPage> {
  final ArtInfoController _artInfoController = Get.put(ArtInfoController());

  late String email = "";
  static const double titlesize = 18;

  @override
  void initState() {

    _artInfoController.select_art_key.value = widget.dockey;
    email = widget.dockey.split("_")[0];
    _artInfoController.getArtInfo();
    _artInfoController.getArtInArtist(email);
    _artInfoController.artinarts.value = <ArtInArt>[];

    //callArt(widget.dockey);
    // TODO: implement initState
    super.initState();
  }

  void callArt(dockey){
    _artInfoController.select_art_key.value = dockey;
    email = dockey.split("_")[0];
    _artInfoController.getArtInfo();
    _artInfoController.getArtInArtist(email);
    _artInfoController.artinarts.value = <ArtInArt>[];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: Obx(() {
          if (_artInfoController.dataLoadingComplete_artinfo.value) {
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
                                  image: NetworkImage(
                                      "${base_url}/artimage/${item.email}/art/preview/${widget.dockey}.jpg"),
                                  fit: BoxFit.fitHeight)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "작품 이미지에 대한 무단 도용 및 재배포를 금지합니다.",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Text(
                          "Copyright © ${item.artArtist}. All rights reserved.",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Util.chageText(item.artTitle ?? ''),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 80,
                                        child: Text(
                                          "작가명",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                      ),
                                      Text(
                                        "${item.artArtist}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 80,
                                        child: Text(
                                          "제작연도",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                      ),
                                      Text(
                                        "${item.artDateYear}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 80,
                                        child: Text(
                                          "장르",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                      ),
                                      Text(
                                        "${item.artGenre}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 80,
                                        child: Text(
                                          "재료",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                      ),
                                      Text(
                                        "${item.artSource}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 80,
                                        child: Text(
                                          "작품코드",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width - 120,
                                        child: Text(
                                          "${item.artkey}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              overflow: TextOverflow.clip),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 1,
                                    decoration:
                                        const BoxDecoration(color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "판매금액",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: Image.asset(
                                              "assets/images/art/ico_won.png",
                                              width: 25,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            Util.addComma2(item.artPrice!),
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: width,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                      onPressed: () {},
                                      child: const Text("작품문의"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  "작품 소개",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: titlesize,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    _artInfoController.artinfo.subfile?.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1),
                                itemBuilder: (context, index) {
                                  Subfile item = _artInfoController
                                      .artinfo.subfile![index];
                                  String email = item.filename.split("_")[0];
                                  String url =
                                      "${base_url}/artimage/${email}/art/${item.filename}";
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 10.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        image: DecorationImage(
                                          image: NetworkImage(url),
                                          fit: BoxFit.cover,
                                        )),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                child: Text(
                                  Util.chageText(item.artExpress ?? ""),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Visibility(
                                visible: item.artCuratorExpress != "",
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "추천 이유",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: titlesize,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    SizedBox(
                                      child: Text(
                                        Util.chageText(
                                            item.artCuratorExpress ?? ""),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              //작가 정보
                              SizedBox(
                                height: 580,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      top: 0,
                                      child: Container(
                                        width: width,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(
                                              "${base_url}/artimage/${item.email.toString().trim()}/photo_list/${item.email}"),
                                          fit: BoxFit.cover,
                                        )),
                                      ),
                                      // child: Image.network(
                                      //     "${base_url}/artimage/${item.email.toString().trim()}/photo_list/${item.email}"),
                                    ),
                                    Positioned(
                                      top: 170,
                                      // left: (width - (width * 0.8)) /2 ,
                                      child: Container(
                                        height: 380,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(3.0, 5.0),
                                                  blurRadius: 17,
                                                  color: Colors.black
                                                      .withOpacity(0.3))
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "A R T I S T INFO",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${item.artArtist}",
                                                    style: const TextStyle(
                                                      fontSize: 23,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 7,
                                                  ),
                                                  const Text(
                                                    "작가",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: width - 300,
                                                      height: 3,
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                height: 170,
                                                child: Text(
                                                  Util.chageText(_artInfoController.artinartist.content ?? ""),
                                                  //maxLines: 8,
                                                  softWrap: true,
                                                  overflow: TextOverflow.clip,
                                                  style: const TextStyle(
                                                    //  letterSpacing: 1.2,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              OutlinedButton(
                                                onPressed: () {
                                                  Get.to(
                                                      () => ArtistDetailPage(
                                                          email: item.email!),
                                                      transition:
                                                          Transition.fadeIn);
                                                },
                                                style: OutlinedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white,
                                                    foregroundColor:
                                                        Colors.black,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                    )),
                                                child: Text("작가정보 더보기"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                height: 50,
                              //  color: Colors.yellow,
                                alignment: Alignment.center,
                                child: const Text(
                                  "작가의 다른 작품",
                                  style: TextStyle(
                                      fontSize: titlesize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              //https://www.gallery360.co.kr/load_image_for_artist.mon?start=0&perpage=22&email=gallery360@gallery360.co.kr-spl-1564710455824
                              //https://www.gallery360.co.kr/load_image_for_artist.mon?start=0&perpage=100&email=gallery360@gallery360.co.kr-spl-1564710455824

                              FutureBuilder(
                                future: _artInfoController
                                    .getArtInArts(item.email!),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      snapshot.hasData) {
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.data.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                                      itemBuilder: (context, index){
                                        ArtInArt item  = snapshot.data[index];
                                        String url = "${base_url}/artimage/${item.email}/art/preview/${item.dockey}.jpg";
                                        return InkWell(
                                          onTap: (){
                                            // print(item.dockey);
                                            // ArtDetailPage(dockey: item.dockey,);
                                            // setState(() {
                                            //   //callArt(item.dockey);
                                            //   //Get.to(() => ArtDetailPage(dockey: item.dockey), transition: Transition.fadeIn);
                                            // });
                                            Get.to(() => ArtDetailPage(dockey: item.dockey), transition: Transition.fadeIn, preventDuplicates: false);
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(url),
                                                fit: BoxFit.cover
                                              )
                                            ),
                                          ),
                                        );
                                      },
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

                              // GridView.builder(
                              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                              //   itemBuilder: (context, ),
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
