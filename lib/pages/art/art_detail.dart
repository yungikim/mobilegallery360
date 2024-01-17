import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/art/controller/art_controller.dart';
import 'package:gallery360/pages/art/photo_view.dart';
import 'package:get/get.dart';
import 'package:linkify/linkify.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:url_launcher/url_launcher.dart';
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

  var field1 = TextEditingController();
  var field2 = TextEditingController();
  var field3 = TextEditingController();
  var field4 = TextEditingController();
  var field5 = TextEditingController();

  late String email = "";
  static const double titlesize = 18;

  @override
  void initState() {
    _artInfoController.select_art_key.value = widget.dockey;
    email = widget.dockey.split("_")[0];
    // _artInfoController.getArtInfo();
    // _artInfoController.getArtInArtist(email);
    _artInfoController.artinarts.value = <ArtInArt>[];

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    field1.dispose();
    field2.dispose();
    field3.dispose();
    field4.dispose();
    field5.dispose();
    super.dispose();
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (!await launchUrl(Uri.parse(link.url))) {
      throw Exception('Could not launch ${link.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return WillPopScope(
      onWillPop: () async{
        Get.back(result: "OK");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Get.back(result: "OK");
                //Get.close(1);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: FutureBuilder(
          future: _artInfoController.getArtInfo2(email),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              var item = snapshot.data;

              String opt = "";
              if (item.opt != null){
                opt = item.opt;
              }
              String price = opt == "none"
                  ? "가격문의"
                  : "${Util.addComma(item.artPrice / 10000)}만원";
              return CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => PhotoDisplay(
                                        dockey: widget.dockey,
                                        email: item.email,
                                      ),
                                  transition: Transition.rightToLeft);
                            },
                            child: Hero(
                              tag: widget.dockey,
                              child: Container(
                                width: width * 0.97,
                                height: ResponsiveBreakpoints.of(context).isMobile ? 350 : ResponsiveBreakpoints.of(context).isTablet ? 450 : 800,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "$base_url/artimage/${item.email}/art/preview/${widget.dockey}.jpg"),
                                        fit: BoxFit.fitHeight)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "작품 이미지에 대한 무단 도용 및 재배포를 금지합니다.",
                            style: TextStyle(
                                fontSize: Util.fSize12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          Text(
                            "Copyright © ${ Util.chageText(item.artArtist)}. All rights reserved.",
                            style: TextStyle(
                              fontSize: Util.fSize12,
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
                                  style: TextStyle(
                                    fontSize: Util.fSize20,
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
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            "작가명",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Util.fSize13),
                                          ),
                                        ),
                                        Text(
                                          Util.chageText(item.artArtist),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Util.fSize14,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            "제작연도",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Util.fSize13),
                                          ),
                                        ),
                                        Text(
                                          "${item.artDateYear}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Util.fSize14,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            "장르",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Util.fSize13),
                                          ),
                                        ),
                                        Text(
                                          "${item.artGenre}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Util.fSize14,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            "재료",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Util.fSize13),
                                          ),
                                        ),
                                        Text(
                                          "${item.artSource}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Util.fSize14,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            "작품코드",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: Util.fSize13),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width - 120,
                                          child: Text(
                                            "${item.artkey}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Util.fSize14,
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
                                        Text(
                                          "판매금액",
                                          style: TextStyle(
                                            fontSize: Util.fSize20,
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
                                              //Util.addComma2(item.artPrice!),
                                              price,
                                              style: TextStyle(
                                                fontSize: Util.fSize20,
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
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                        onPressed: () {
                                          showDialogWithRequest();
                                        },
                                        child: Text("작품문의", style: TextStyle(fontSize: Util.fSize13),),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "작품 소개",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Util.fSize18,
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
                                        "$base_url/artimage/$email/art/${item.filename}";
                                    return cacheImage(
                                      url: url,
                                      margin: const EdgeInsets.only(bottom: 10.0),
                                      bordertext: Border.all(color: Colors.grey),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Linkify(
                                  onOpen: _onOpen,
                                  text: Util.chageText(item.artExpress ?? ""),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: Util.fSize14),
                                  linkStyle: const TextStyle(color: Colors.blue),
                                  linkifiers: const [
                                    UserTagLinkifier(),
                                    PhoneNumberLinkifier(),
                                    EmailLinkifier(),
                                    UrlLinkifier(),
                                  ],
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
                                        child: Text(
                                          "추천 이유",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Util.fSize18,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      Linkify(
                                        onOpen: _onOpen,
                                        text: Util.chageText(
                                            item.artCuratorExpress ?? ""),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: Util.fSize14),
                                        linkStyle:
                                            const TextStyle(color: Colors.blue),
                                        linkifiers: const [
                                          UserTagLinkifier(),
                                          PhoneNumberLinkifier(),
                                          EmailLinkifier(),
                                          UrlLinkifier(),
                                        ],
                                      )
                                      // SizedBox(
                                      //   child: Text(
                                      //     Util.chageText(
                                      //         item.artCuratorExpress ?? ""),
                                      //     style: const TextStyle(
                                      //         fontWeight: FontWeight.w500,
                                      //         fontSize: 14),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 10,
                                ),

                                //작가 정보
                                SizedBox(
                                  height:
                                      ResponsiveBreakpoints.of(context).isMobile
                                          ? 580
                                          : 650,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        top: 0,
                                        child: Container(
                                          width: width,
                                          height:
                                              ResponsiveBreakpoints.of(context)
                                                      .isMobile
                                                  ? 200
                                                  : 350,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: NetworkImage(
                                                "$base_url/artimage/${item.email.toString().trim()}/photo_list/${item.email}"),
                                            fit: BoxFit.cover,
                                          )),
                                        ),
                                        // child: Image.network(
                                        //     "${base_url}/artimage/${item.email.toString().trim()}/photo_list/${item.email}"),
                                      ),
                                      Positioned(
                                        top: ResponsiveBreakpoints.of(context)
                                                .isMobile
                                            ? 170
                                            : 260,
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
                                                    offset:
                                                        const Offset(3.0, 5.0),
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
                                                Text(
                                                  "A R T I S T INFO",
                                                  style: TextStyle(
                                                      fontSize: Util.fSize14,
                                                      color: Colors.grey),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    SizedBox(
                                                      width: Util.chageText(item.artArtist)
                                                                  .toString()
                                                                  .length >
                                                              5
                                                          ? 170
                                                          : 80,
                                                      child: Text(
                                                        Util.chageText(item.artArtist),
                                                        style: TextStyle(
                                                          fontSize: Util.fSize15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 7,
                                                    ),
                                                    Text(
                                                      "작가",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: Util.fSize15),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        //width: width - 300,
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
                                                    Util.chageText(
                                                        _artInfoController
                                                                .artinartist
                                                                .content ??
                                                            ""),
                                                    //maxLines: 8,
                                                    softWrap: true,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                      //  letterSpacing: 1.2,
                                                      fontSize: Util.fSize16,
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
                                                            Transition.rightToLeft,
                                                        preventDuplicates: false);
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
                                                  child: Text("작가정보 더보기", style: TextStyle(fontSize: Util.fSize14),),
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
                                  child: Text(
                                    "작가의 다른 작품",
                                    style: TextStyle(
                                        fontSize: Util.fSize18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 30,),
                                FutureBuilder(
                                  future: _artInfoController
                                      .getArtInArts(item.email!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.done &&
                                        snapshot.hasData) {
                                      return GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4),
                                        itemBuilder: (context, index) {
                                          ArtInArt item = snapshot.data[index];
                                          String url =
                                              "$base_url/artimage/${item.email}/art/preview/${item.dockey}.jpg";
                                          return InkWell(
                                            onTap: () {
                                              Get.to(
                                                  () => ArtDetailPage(
                                                      dockey: item.dockey),
                                                  transition: Transition.fadeIn,
                                                  preventDuplicates: false);
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(2.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey.shade300),
                                                  image: DecorationImage(
                                                      image: NetworkImage(url),
                                                      fit: BoxFit.cover)),
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
      ),
    );
  }

  void showDialogWithRequest() {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          backgroundColor: Colors.white,
          scrollable: true,
          //팝업의 높이를 적당히 맞춰주는 설정
          title: const Text("작품 문의"),
          content: Builder(
            builder: (context) {
              final width = MediaQuery.of(context).size.width;
              return SizedBox(
                width: ResponsiveBreakpoints.of(context).isMobile
                    ? 600
                    : width - 100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                            "해당 작품에 대한 문의사항이 있을 경우 문의사항 남겨주시면 담당 큐레이터가 확인 후 빠르게 답변드리겠습니다."),
                        const SizedBox(
                          height: 30,
                        ),
                        //   Container(width: double.infinity, color: Colors.grey, height: 1,),
                        //   const SizedBox(height: 20,),
                        TextFormField(
                          controller: field1,
                          decoration:
                              const InputDecoration(hintText: "제목을 입력하세요"),
                          validator: (value){
                            if (value?.isEmpty ?? true) return "제목을 입력해주세요";
                          },
                        ),
                        TextFormField(
                          controller: field2,
                          decoration:
                              const InputDecoration(hintText: "이름을 입력하세요"),
                          validator: (value){
                            if (value?.isEmpty ?? true) return "이름을 입력해주세요";
                          },
                        ),
                        TextFormField(
                          controller: field3,
                          decoration:
                              const InputDecoration(hintText: "이메일을 입력하세요"),
                          validator: (value){
                            if (value?.isEmpty ?? true) return "이메일을 입력해주세요";
                          },
                        ),
                        TextFormField(
                          controller: field4,
                          decoration:
                              const InputDecoration(hintText: "연락처를 입력하세요"),
                          validator: (value){
                            if (value?.isEmpty ?? true) return "연락처를 입력해주세요";
                          },
                        ),
                        TextFormField(
                          controller: field5,
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: 5,
                          decoration: const InputDecoration(hintText: "문의 내용을 입력하세요"),
                          validator: (value){
                            if (value?.isEmpty ?? true) return "문의 내용을 입력해주세요";
                          },

                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                _artInfoController.subject.value = field1.text;
                _artInfoController.name.value = field2.text;
                _artInfoController.email.value = field3.text;
                _artInfoController.tel.value = field4.text;
                _artInfoController.content.value = field5.text;
                _artInfoController.art_code.value =
                    _artInfoController.artinfo.dockey.toString();
                _artInfoController.art_artist.value =
                    _artInfoController.artinfo.artArtist.toString();
                _artInfoController.art_title.value =
                    _artInfoController.artinfo.artTitle.toString();


                bool validationResult = formKey.currentState?.validate() ?? false;
                if (validationResult){

                  _artInfoController.SaveArtRequest();
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                }

              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              child: const Text("문의하기"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
              child: const Text("취소"),
            ),
          ],
        );
      },
    );
  }
}
