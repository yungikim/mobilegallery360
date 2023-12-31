import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/pages/art/art_detail.dart';
import 'package:gallery360/pages/art/controller/art_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../const/const.dart';
import '../../icons/custom_icons_icons.dart';
import '../../util/Util.dart';
import 'bottom_sheet/bottom_sheet.dart';
import 'model/art_list_model.dart';
import 'model/art_monthly_list.dart';

class ArtMainPage extends StatefulWidget {
  const ArtMainPage({super.key});

  @override
  State<ArtMainPage> createState() => _ArtMainPageState();
}

class _ArtMainPageState extends State<ArtMainPage> with WidgetsBindingObserver{
  final ArtInfoController _artInfoController = Get.put(ArtInfoController());

  //콤보박스 설정하기
  late List<DropdownMenuItem<ValueOptions_Art>> _valueItems;
  // late ValueOptions_Art _selectedValue;

  //무한 스크롤 설정
  late ScrollController _scrollController;

  @override
  void initState() {
    //print("initState..........");
    //콤보 박스 설정하기
    List<ValueOptions_Art> values = ValueOptions_Art.allValuesOptions;
    _scrollController = ScrollController();
    _scrollController.addListener(onScroll);

    _valueItems = values.map<DropdownMenuItem<ValueOptions_Art>>(
        (ValueOptions_Art valueOption) {
      return DropdownMenuItem<ValueOptions_Art>(
        value: valueOption,
        child: Text(valueOption.title),
      );
    }).toList();

    _artInfoController.hasMore_art.value = true;
    _artInfoController.page_art.value = 1;
    _artInfoController.artinfolist.value = [];
    _artInfoController.type.value = "random";
    //  _selectedValue = values[0];
    _artInfoController.selectedValue.value = values[0];

    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(onScroll);

    WidgetsBinding.instance.removeObserver(this);
    // TODO: implement dispose
    super.dispose();
  }

  void onScroll() {
    //print("onScroll............");
    _artInfoController.saveScrollPosition(_scrollController.offset);

    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;

    if (maxScroll == currentScroll && _artInfoController.hasMore_art.value) {
      if (_artInfoController.isSearch.value) {
        _artInfoController.getArtList_option("F");
      } else {
        _artInfoController.getArtList();
      }
    }
  }


  void changePosition() {

      // 앱이 다시 활성화될 때 스크롤 위치 복원
      if (_scrollController.hasClients) {
       // print(_artInfoController.scrollPosition.value);
        _scrollController.jumpTo(_artInfoController.scrollPosition.value);
      }

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: actionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: customAppBar(context),
        ),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
                child: FutureBuilder(
              future: _artInfoController.getArtMainMonly(),
              builder: (context, snapshot) {
                List<ArtMonth> list = <ArtMonth>[];
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Connection Error"),
                    );
                  } else {
                    //이미지 URL을 리스트로 지정한다.
                    List<String> list_urls = [];
                    for (int i = 0;
                        i < _artInfoController.monthlyart.length;
                        i++) {
                      list_urls.add("1");
                    }
                    return CarouselSlider(
                      items: _artInfoController.monthlyart
                          .map((item) => GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => ArtDetailPage(dockey: item.dockey),
                                      transition: Transition.rightToLeft);
                                },
                                child: cacheImage(
                                  url:
                                      "$base_url/artimage/${item.email}/art/expand/${item.dockey}.jpg",
                                //  width: double.infinity,
                                //  height: 100,
                                  childtext: Stack(
                                    children: [
                                      Positioned(
                                        top: 100,
                                        left: 30,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width - 50,
                                              child: Text(
                                                Util.chageText(item.artTitle),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: Util.fSize28,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              Util.chageText(item.artArtist),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Util.fSize22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.darken),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: ResponsiveBreakpoints.of(context).isDesktop ? 17 / 12 : ResponsiveBreakpoints.of(context).isTablet ? 20 / 12 :  14 / 12,
                        autoPlayInterval: const Duration(seconds: 5),
                        viewportFraction: 1.0,
                      ),
                    );
                  }
                }
                return Text("111");
              },
            )),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: SampleHeaderDelegate(
                widget: Obx(
                  () => Container(
                    height: _artInfoController.persistenHeight.value.toDouble(),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 110,
                                child: DropdownButton<ValueOptions_Art>(
                                  isExpanded: true,
                                  //  menuMaxHeight: 300.0,
                                  //  itemHeight: null,
                                  underline: const SizedBox(),
                                  //  value: _selectedValue,
                                  value: _artInfoController.selectedValue.value,
                                  items: _valueItems,
                                  onChanged: (newValue2) {
                                    // setState(() {
                                    _artInfoController.isSearch.value = false;
                                    // _selectedValue = newValue2!;
                                    _artInfoController.selectedValue.value =
                                        newValue2!;
                                    _artInfoController.type.value =
                                        _artInfoController
                                            .selectedValue.value.key;
                                    _artInfoController.refreshData();
                                    //  });
                                  },
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  ShowBottomSheet(context);
                                },
                                child: Row(
                                  children: [
                                    Text("Filter", style: TextStyle(fontSize: Util.fSize14),),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.filter_1_outlined)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible: _artInfoController.query_dis.isNotEmpty,
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: ListView.builder(
                                itemCount: _artInfoController.query_dis.length,
                                itemBuilder: (context, index) {
                                  String txt =
                                      _artInfoController.query_dis[index];
                                  bool iscircle = txt.contains("_");
                                  txt = txt.replaceAll("_", "");
                                  return iscircle
                                      ? GestureDetector(
                                          onTap: () {
                                            _artInfoController.query_color
                                                .removeWhere((element) =>
                                                    element == "${txt}_");
                                            _artInfoController.query_dis
                                                .removeWhere((element) =>
                                                    element == "${txt}_");
                                            _artInfoController
                                                .getArtList_option("T");
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 5.0),
                                            height: 50,
                                            width: 50,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: checkColor(txt),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey)),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            _artInfoController.query_thema
                                                .removeWhere((element) =>
                                                    element == txt);
                                            _artInfoController.query_shape
                                                .removeWhere((element) =>
                                                    element == checkBun(txt));
                                            _artInfoController.query_size
                                                .removeWhere((element) =>
                                                    element ==
                                                    checkSizeBun(txt));
                                            if (txt.contains("만원")) {
                                              _artInfoController
                                                      .query_price.value =
                                                  const RangeValues(0, 0);
                                            }
                                            _artInfoController.query_dis
                                                .removeWhere((element) =>
                                                    element == txt);

                                            // if (_artInfoController.query_dis.isEmpty){
                                            //   _artInfoController.persistenHeight.value = 70;
                                            // }

                                            _artInfoController
                                                .getArtList_option("T");
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(5.0),
                                            padding: const EdgeInsets.all(10.0),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: Row(
                                              children: [
                                                Text(
                                                  txt,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black
                                                          .withOpacity(0.6)),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Image.asset(
                                                    "assets/images/art/btn-aw-filter-delete.png")
                                              ],
                                            ),
                                          ),
                                        );
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: _artInfoController.getArtList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text("Connection Error"),
                        );
                      } else {
                        return Obx(
                          () => MasonryGridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            //  itemCount: snapshot.data.length,
                            itemCount: _artInfoController.artinfolist.length,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            gridDelegate:
                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        ResponsiveBreakpoints.of(context)
                                                .isMobile
                                            ? 2
                                            : 3),
                            //   () => GridView.builder(
                            // shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            // //  itemCount: snapshot.data.length,
                            // itemCount: _artInfoController.artinfolist.length,
                            //
                            // gridDelegate:
                            // SliverGridDelegateWithFixedCrossAxisCount(
                            //     mainAxisSpacing: 10,
                            //     crossAxisSpacing: 10,
                            //     crossAxisCount:
                            //     ResponsiveBreakpoints.of(context)
                            //         .isMobile
                            //         ? 2
                            //         : 3),
                            itemBuilder: (context, index) {
                              //ArtList item = snapshot.data[index];
                              // print(
                              //     "_artInfoController.artinfolist.length, : ${_artInfoController.artinfolist.length}");
                              ArtList item =
                                  _artInfoController.artinfolist.value[index];
                              String url = Util.makeMainArtListURL(
                                  item.email, item.artImgFilename);
                              String art_title = Util.chageText(item.artTitle);
                              String art_artist = item.artArtist;
                              String width = item.artWidth;
                              String height = item.artHeight;
                              int hosu = item.artHosu ?? 0;
                              String art_dis = "${height}x$width($hosu호)";
                              String opt = item.opt ?? '';
                              String price = opt == "none"
                                  ? "가격문의"
                                  : "￦${Util.addComma(item.artPrice / 10000)}만원";

                              return GestureDetector(
                                onTap: () async{
                                  //print("111  =>: ${_artInfoController.artinfolist.length}");
                                  final result = await Get.to(
                                      () => ArtDetailPage(
                                          dockey: item.artImgFilename),
                                      transition: Transition.rightToLeft);
                                  //print("result : ${result}");
                                  if (result != null){
                                    int cnt = _artInfoController.artinfolist.length;
                                    int du = 800;
                                    if (cnt > 150){
                                      du = 1200;
                                    }else if (cnt > 200){
                                      du = 2000;
                                    }else if (cnt > 250){
                                      du = 3000;
                                    }else if (cnt > 300){
                                      du = 5000;
                                    }
                                    Timer(Duration(milliseconds: du), (){

                                      changePosition();
                                    });

                                  }
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: url,
                                        // placeholder: (context, url) =>
                                        //     const CircularProgressIndicator(),
                                        fit: BoxFit.cover,
                                        imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                                        // progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        //     CircularProgressIndicator(value: downloadProgress.progress),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),

                                        // // 이미지가 완전히 로드될 때 호출됩니다.
                                        // loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                        //   if (loadingProgress == null) {
                                        //     // 이미지 로드 완료
                                        //     controller.imageLoaded();
                                        //   }
                                        //   return child;
                                        // },
                                      ),
                                     // cacheImageOnly(url: url,),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Util.chageText(art_title),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Util.fSize13),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              Util.chageText(art_artist),
                                              style:
                                              TextStyle(fontSize: Util.fSize12),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              art_dis,
                                              style: TextStyle(
                                                  fontSize: Util.fSize12,
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                            ),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  price,
                                                  style: TextStyle(
                                                      fontSize: Util.fSize12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      CustomIcons
                                                          .icon_artwork_original,
                                                      color: Colors.grey,
                                                      size: Util.fSize15,
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Icon(
                                                      CustomIcons
                                                          .icon_artwork_vr,
                                                      color: Colors.grey,
                                                      size: Util.fSize15,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            )
          ],
        ));
  }
}

class ValueOptions_Art {
  final String key;
  final String title;

  ValueOptions_Art(this.key, this.title);

  static List<ValueOptions_Art> get allValuesOptions => [
        ValueOptions_Art("random", "랜덤정렬"),
        ValueOptions_Art("date", "최신순"),
        ValueOptions_Art("priceu", "높은 가격순"),
        ValueOptions_Art("priced", "낮은 가격순"),
      ];
}

class SampleHeaderDelegate extends SliverPersistentHeaderDelegate {
  SampleHeaderDelegate({required this.widget});

  final ArtInfoController _artInfoController = Get.put(ArtInfoController());

  Widget widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => _artInfoController.persistenHeight.value.toDouble();

  @override
  double get minExtent => _artInfoController.persistenHeight.value.toDouble();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
