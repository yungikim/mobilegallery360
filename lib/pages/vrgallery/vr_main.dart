import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/pages/vrgallery/controller/vrcontroller.dart';
import 'package:gallery360/pages/vrgallery/vr_detail.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../const/const.dart';
import '../../icons/custom_icons_icons.dart';
import '../../util/Util.dart';
import '../MainPart/screen/widgets/models/vr_model.dart';
import '../MainPart/screen/widgets/vr_list2.dart';

class VrMainPage extends StatefulWidget {
  VrMainPage({super.key});

  @override
  State<VrMainPage> createState() => _VrMainPageState();
}

class _VrMainPageState extends State<VrMainPage> {
  final VrController _vrController = Get.put(VrController());

  late final CarouselController _carouselController;
  late final CarouselController _carouselController2;
  int activeIndex = 0;

  //콤보박스 설정하기
  late List<DropdownMenuItem<ValueOptions>> _valueItems;
  late ValueOptions _selectedValue;

  //무한 스크롤 설정
  late ScrollController _scrollController;

  @override
  void initState() {
    _carouselController = CarouselController();
    _carouselController2 = CarouselController();

    //콤보 박스 설정하기
    List<ValueOptions> values = ValueOptions.allValuesOptions;
    _scrollController = ScrollController();
    _scrollController.addListener(onScroll);

    _valueItems =
        values.map<DropdownMenuItem<ValueOptions>>((ValueOptions valueOption) {
      return DropdownMenuItem<ValueOptions>(
        value: valueOption,
        child: Text(valueOption.title),
      );
    }).toList();

    _vrController.hasMore_vr.value = true;
    _vrController.page_vr.value = 1;
    _vrController.svrslist.value = [];
    _vrController.sort_vr.value = "0";
    _selectedValue = values[0];

    // TODO: implement initState
    super.initState();
  }

  void onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;

    if (maxScroll == currentScroll && _vrController.hasMore_vr.value) {
      _vrController.getMainVRList();
    }
  }

  Widget indicator() => Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        alignment: Alignment.bottomCenter,
        child: Obx(
          () => AnimatedSmoothIndicator(
            activeIndex: _vrController.activeIndex.value,
            count: _vrController.mainvrs.length,
            onDotClicked: (index) {
              _carouselController.animateToPage(index);
            },
            effect: JumpingDotEffect(
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: Colors.white,
              dotColor: Colors.white.withOpacity(0.4),
            ),
          ),
        ),
      );

  Widget indicator2() => Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        alignment: Alignment.bottomCenter,
        child: Obx(
          () => AnimatedSmoothIndicator(
            activeIndex: _vrController.activeIndex2.value,
            count: ResponsiveBreakpoints.of(context).isMobile
                ? _vrController.svrs.length
                : (_vrController.svrs.length / 2).round(),
            onDotClicked: (index) {
              _carouselController2.animateToPage(index);
            },
            effect: JumpingDotEffect(
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: Colors.grey.withOpacity(0.9),
              dotColor: Colors.grey.withOpacity(0.4),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: customAppBar(context),
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // 최상단 케러셀 보기
            SliverToBoxAdapter(
              child: FutureBuilder(
                future: _vrController.MakeMainVrs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Obx(
                          () => CarouselSlider(
                            carouselController: _carouselController,
                            items: _vrController.mainvrs
                                .map(
                                  (item) => GestureDetector(
                                    onTap: () {
                                      ResponsiveBreakpoints.of(context).isMobile ? Get.to(
                                          () =>
                                              VrDetailPage(dockey: item.dockey), transition: Transition.rightToLeft) : null;
                                    },
                                    child: cacheImage(
                                      url: item.url,
                                      width: double.infinity,
                                      height: 600,
                                      childtext: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ResponsiveBreakpoints.of(context)
                                                  .isMobile
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      Util.chageText(
                                                          item.space),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      Util.chageText(
                                                          item.title),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      Util.chageText(
                                                          item.space),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      Util.chageText(
                                                          item.title),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 32,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 20),
                                                      width: 50,
                                                      height: 1,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      Util.chageText(
                                                          item.subtitle),
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,
                                                    ),
                                                    OutlinedButton(
                                                      onPressed: () {
                                                        Get.to(() => VrDetailPage(dockey: item.dockey), transition: Transition.rightToLeft);
                                                      },
                                                      style: OutlinedButton.styleFrom(
                                                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                                        side: const BorderSide(color: Colors.white),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(0.0)
                                                        )
                                                      ),
                                                      child: const Text(
                                                        "VR전시 감상하기",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                        ],
                                      ),
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.3),
                                          BlendMode.darken),
                                    ),
                                  ),
                                )
                                .toList(),
                            options: CarouselOptions(
                                aspectRatio: 4 / 3,
                                viewportFraction: 1,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  _vrController.activeIndex.value = index;
                                }),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: indicator(),
                        )
                      ],
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
            ),

            //추천 VR 갤러리 텍스트
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      "추천 VR 갤러리",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            //2번째 추천 VR Carousel
            SliverToBoxAdapter(
              child: FutureBuilder(
                future: _vrController.getMainVR(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    List<VRModel> list = snapshot.data;
                    return Column(
                      children: [
                        Obx(
                          () => CarouselSlider.builder(
                            carouselController: _carouselController2,
                            itemCount:
                                ResponsiveBreakpoints.of(context).isMobile
                                    ? _vrController.svrs.length
                                    : (_vrController.svrs.length / 2).round(),
                            itemBuilder: (context, index, realidx) {
                              VRModel item = list[index];
                              String url = Util.VrUrl(item.dockey.toString());

                              final int first = index * 2;
                              final int second = first + 1;

                              return ResponsiveBreakpoints.of(context).isMobile
                                  ? GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => VrDetailPage(
                                                dockey: '${item.dockey}'),
                                            transition: Transition.rightToLeft);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(url),
                                          fit: BoxFit.cover,
                                        )),
                                        child: CarouselInnerText(
                                          e: item,
                                        ),
                                      ),
                                    )
                                  : Row(
                                      children: [first, second].map((idx) {
                                        VRModel item = list[idx];
                                        String url =
                                            Util.VrUrl(item.dockey.toString());
                                        return Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  () => VrDetailPage(
                                                      dockey: '${item.dockey}'),
                                                  transition:
                                                      Transition.rightToLeft);
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                image: NetworkImage(Util.VrUrl(
                                                    list[idx]
                                                        .dockey
                                                        .toString())),
                                                fit: BoxFit.cover,
                                              )),
                                              child: CarouselInnerText(
                                                e: item,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                            },
                            options: CarouselOptions(
                                viewportFraction: 1,
                                aspectRatio:
                                    ResponsiveBreakpoints.of(context).isMobile
                                        ? 5 / 3
                                        : 16 / 6,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 8),
                                onPageChanged: (index, reason) {
                                  _vrController.activeIndex2.value = index;
                                }),
                          ),
                        ),
                        Container(
                          height: 60,
                          alignment: Alignment.center,
                          child: indicator2(),
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
            ),

            //가운데 콤보박스 와 건수 표시하는 부분
            SliverPersistentHeader(
              pinned: true,
              delegate: SampleHeaderDelegate(
                  widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 110,
                        child: DropdownButton<ValueOptions>(
                          isExpanded: true,
                          //  menuMaxHeight: 300.0,
                          //  itemHeight: null,
                          underline: const SizedBox(),
                          value: _selectedValue,
                          items: _valueItems,
                          onChanged: (newValue) {
                            // setState(() {
                            _selectedValue = newValue!;
                            _vrController.sort_vr.value = _selectedValue.key;
                            _vrController.refreshData();
                            // state2.getUser();
                            // print(_selectedValue.key);
                            //  });
                          },
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${Util.addComma2(_vrController.currentcount.value)}/${Util.addComma2(_vrController.totalcount.value)}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ),

            //하단 VR갤러리 리스트 표시하는 부분
            SliverToBoxAdapter(
              child: FutureBuilder(
                future: _vrController.getMainVRList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: MasonryGridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _vrController.svrslist.length,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          gridDelegate:
                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      ResponsiveBreakpoints.of(context).isMobile
                                          ? 1
                                          : 2),
                          itemBuilder: (context, index) {
                            var item = _vrController.svrslist.value[index];
                            var url = Util.VrUrl(item.dockey.toString());
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                    () =>
                                        VrDetailPage(dockey: '${item.dockey}'),
                                    transition: Transition.rightToLeft);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 270,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(url),
                                        fit: BoxFit.cover,
                                      ),
                                    ), //child:
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    Util.chageText(item.title ?? ""),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    item.nickname ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                          CustomIcons.icon_vr_view_count_b),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(Util.addComma2(item.read ?? 0)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                          CustomIcons.icon_vr_collect_count_b),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text("${item.like}"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
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
        ));
  }
}



class ValueOptions {
  final String key;
  final String title;

  ValueOptions(this.key, this.title);

  static List<ValueOptions> get allValuesOptions => [
        ValueOptions("0", "랜덤정렬"),
        ValueOptions("1", "최신순"),
        ValueOptions("2", "닉네임순"),
      ];
}


class SampleHeaderDelegate extends SliverPersistentHeaderDelegate {
  SampleHeaderDelegate({required this.widget});

  Widget widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}