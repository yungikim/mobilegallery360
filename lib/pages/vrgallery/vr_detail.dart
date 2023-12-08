import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/icons/custom_icons_icons.dart';
import 'package:gallery360/pages/vrgallery/controller/vrcontroller.dart';
import 'package:gallery360/pages/vrgallery/model/vr_detail_first.dart';
import 'package:gallery360/pages/vrgallery/model/vr_detail_second.dart';
import 'package:gallery360/pages/vrgallery/model/vr_detail_third.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../util/Util.dart';
import '../art/art_detail.dart';
import '../artist/artist_detail.dart';

class VrDetailPage extends StatefulWidget {
  const VrDetailPage({super.key, required this.dockey});

  final String dockey;

  @override
  State<VrDetailPage> createState() => _VrDetailPageState();
}

class _VrDetailPageState extends State<VrDetailPage> {
  final VrController _vrController = Get.put(VrController());

  @override
  void initState() {
    _vrController.selectKey.value = widget.dockey;
    _vrController.selectEmail.value = Util.extractEmail(widget.dockey);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  weight: 10,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              // title: Text("111111", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.7)),),
              floating: true,
              pinned: true,
              expandedHeight: 520,
              flexibleSpace: FlexibleSpaceBar(
                background: InAppWebView(
                  //initialFile: "assets/html/index.html",
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                      () => CustomGestureWidget(),
                    ),
                  },
                  initialUrlRequest: URLRequest(
                      //   url: Uri.parse('http://localhost:8080/html/index.html?open&ver=1.0')
                      url: Uri.parse(
                          '$base_url/main/vr_gallery/gallery360_vr_pfizer.jsp?key=${widget.dockey}')),

                  onReceivedServerTrustAuthRequest:
                      (controller, challenge) async {
                    return ServerTrustAuthResponse(
                        action: ServerTrustAuthResponseAction.PROCEED);
                  },

                  initialOptions: InAppWebViewGroupOptions(
                      android: AndroidInAppWebViewOptions(
                        useHybridComposition: true,
                        mixedContentMode:
                            AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
                      ),
                      ios: IOSInAppWebViewOptions(
                        allowsInlineMediaPlayback: true,
                        useOnNavigationResponse: true,
                        scrollsToTop: false,
                      ),
                      crossPlatform: InAppWebViewOptions(
                        supportZoom: true,
                        preferredContentMode: UserPreferredContentMode.MOBILE,
                        useShouldOverrideUrlLoading: true,
                        mediaPlaybackRequiresUserGesture: false,
                        cacheEnabled: true,
                        clearCache: true,
                        transparentBackground: true,
                        javaScriptEnabled: true,
                      )),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: const Column(
                  children: [
                    Text(
                      "VR갤러리 이미지에 대한 활용 및 재배포시 출처를 반드시 남겨주세요.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Copyright © 2018-2023 Gallery360. All Rights Reserved.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(""),
                  ],
                ),
              ),
            ),

            //VR갤러리 설명과 작가 설명 화면
            SliverToBoxAdapter(
              child: FutureBuilder(
                future: _vrController.getVrDetailFirst(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    VrDetailFirst item = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Util.chageText(item.title.toString()),
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(CustomIcons.icon_vr_view_count_b),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${item.read}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Icon(CustomIcons.icon_vr_collect_count_b),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${item.like}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                "게시일 ${Util.changeDate(item.date.toString())}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            Util.chageText(item.express.toString()),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "$base_url/artimage/${item.email}/photo/${item.email}?open",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${item.nickname}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    side: const BorderSide(
                                      color: Colors.grey,
                                    )),
                                onPressed: () {
                                  Get.to(
                                      () => ArtistDetailPage(
                                          email: item.email.toString()),
                                      transition: Transition.rightToLeft,
                                      preventDuplicates: false);
                                },
                                child: const Text(
                                  "작가",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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

            //작가의 VR갤러리 리스트 케러셀로 표시하기
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    FutureBuilder(
                      future: _vrController.getVrDetailSecond(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          VrDetailSecond xitem = snapshot.data[0];
                          List<VrDetailSecond> list = snapshot.data;
                          return Column(
                            children: [
                              Text(
                                "${xitem.nickname}의 VR갤러리",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CarouselSlider.builder(
                                itemCount: _vrController.vrsecond.length,
                                itemBuilder: (context, index, realidx) {
                                  VrDetailSecond item = list[index];
                                  String url =
                                      Util.VrUrl(item.dockey.toString());
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                          () =>
                                              VrDetailPage(dockey: item.dockey),
                                          transition: Transition.rightToLeft,
                                          preventDuplicates: false);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(url),
                                        fit: BoxFit.cover,
                                      )),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 20.0,
                                            left: 15.0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Util.chageText(
                                                      item.title.toString()),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      shadows: [
                                                        Shadow(
                                                          offset:
                                                              Offset(1.0, 0.0),
                                                          blurRadius: 3,
                                                          color: Colors.black,
                                                        )
                                                      ]),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  item.nickname,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      shadows: [
                                                        Shadow(
                                                          offset:
                                                              Offset(1.0, 0.0),
                                                          blurRadius: 3.0,
                                                          color: Colors.black,
                                                        )
                                                      ]),
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.dataset_linked,
                                                      color: Colors.white,
                                                      shadows: [
                                                        Shadow(
                                                          offset:
                                                              Offset(1.0, 0.0),
                                                          blurRadius: 3,
                                                          color: Colors.black,
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "${item.read}",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          shadows: [
                                                            Shadow(
                                                              offset:
                                                                  Offset(1, 0),
                                                              blurRadius: 3,
                                                              color:
                                                                  Colors.black,
                                                            )
                                                          ]),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .favorite_border_outlined,
                                                      color: Colors.white,
                                                      shadows: [
                                                        Shadow(
                                                          offset:
                                                              Offset(1.0, 0.0),
                                                          blurRadius: 3,
                                                          color: Colors.black,
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "${item.like}",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          shadows: [
                                                            Shadow(
                                                              offset: Offset(
                                                                  1.0, 0.0),
                                                              blurRadius: 3,
                                                              color:
                                                                  Colors.black,
                                                            )
                                                          ]),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  viewportFraction: 1.0,
                                  autoPlay: true,
                                  enableInfiniteScroll: false,
                                ),
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
                  ],
                ),
              ),
            ),

            //작가의 기타 작품 리스트 표시하기
            SliverToBoxAdapter(
              child: FutureBuilder(
                future: _vrController.getVrDetailThird(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _vrController.vrthird.length,

                        //  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: ResponsiveBreakpoints.of(context).isMobile ? 3 : 4),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              ResponsiveBreakpoints.of(context).isMobile
                                  ? 3
                                  : 4,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          VrDetailThird item =
                              _vrController.vrthird.value[index];
                          String url =
                              "$base_url/artimage/${item.email}/art/preview/${item.dockey}.jpg";
                          // return Image.network(
                          //   url,
                          //   fit: BoxFit.cover,
                          // );
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => ArtDetailPage(dockey: item.dockey),
                                  transition: Transition.rightToLeft);
                            },
                            child: cacheImageOnly(
                              url: url,
                            ),
                          );
                        },
                      ),
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
          ],
        ),
      ),
    );
  }
}

class CustomGestureWidget extends OneSequenceGestureRecognizer {
  CustomGestureWidget();

  @override
  void addAllowedPointer(PointerDownEvent event) {
    startTrackingPointer(event.pointer, event.transform);
    resolve(GestureDisposition.accepted);
    stopTrackingPointer(event.pointer);
  }

  @override
  String get debugDescription => 'eager';

  @override
  void didStopTrackingLastPointer(int pointer) {
    print("pointer: $pointer");
  }

  @override
  void handleEvent(PointerEvent event) {
    print("event: $event");
  }
}
