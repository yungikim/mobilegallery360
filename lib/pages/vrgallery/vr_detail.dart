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
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../util/Util.dart';

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
              pinned: false,
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
                    print(challenge);
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
                        mediaPlaybackRequiresUserGesture: true,
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
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: const Column(
                  children: [
                    Text(
                      "VR갤러리 이미지에 대한 활용 및 재배포시 출처를 반드시 남겨주세요.",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Text(
                      "Copyright © 2018-2023 Gallery360. All Rights Reserved.",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
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
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${item.title}",
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
                                    fontWeight: FontWeight.bold, fontSize: 16),
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
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                "게시일 ${Util.changeDate(item.date.toString())}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
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
                                width: 60,
                                height: 60,
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
                                "${item.nickname} 작가",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                onPressed: () {},
                                child: const Text(
                                  "작가",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
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
              child: Container(
                height: 300,
                color: Colors.blue,
                child: Column(
                  children: [
                    FutureBuilder(
                      future: _vrController.getVrDetailSecond(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          VrDetailSecond item = snapshot.data[0];
                          return Column(
                            children: [
                              Text(
                                "${item.nickname}의 VR갤러리",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CarouselSlider(
                                items: _vrController.vrsecond.map((item) => Container(
                                  child: Text(item.dockey),
                                )).toList(),
                                options: CarouselOptions(

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
              child: Container(
                height: 800,
                color: Colors.red,
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
