import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/pages/art/art_detail.dart';
import 'package:gallery360/pages/art/controller/art_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../const/const.dart';
import '../../icons/custom_icons_icons.dart';
import '../../util/Util.dart';
import 'model/art_list_model.dart';
import 'model/art_monthly_list.dart';

class ArtMainPage extends StatefulWidget {
  const ArtMainPage({super.key});

  @override
  State<ArtMainPage> createState() => _ArtMainPageState();
}

class _ArtMainPageState extends State<ArtMainPage> {
  final ArtInfoController _artInfoController = Get.put(ArtInfoController());

  //콤보박스 설정하기
  late List<DropdownMenuItem<ValueOptions>> _valueItems;
  late ValueOptions _selectedValue;

  //무한 스크롤 설정
  late ScrollController _scrollController;

  @override
  void initState() {
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

    _artInfoController.hasMore_art.value = true;
    _artInfoController.page_art.value = 1;
    _artInfoController.artinfolist.value = [];
    _artInfoController.type.value = "random";
    _selectedValue = values[0];

    print("11111111");

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(onScroll);

    // TODO: implement dispose
    super.dispose();
  }

  void onScroll(){
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;

    if (maxScroll == currentScroll && _artInfoController.hasMore_art.value) {
      _artInfoController.getArtList();
    }
  }

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
                for (int i = 0; i < _artInfoController.monthlyart.length; i++) {
                  list_urls.add("1");
                }
                return CarouselSlider(
                  items: _artInfoController.monthlyart
                      .map((item) => GestureDetector(
                    onTap: (){
                      Get.to(() => ArtDetailPage(dockey: item.dockey), transition: Transition.fadeIn);
                    },
                        child: cacheImage(
                              url:
                                  "${base_url}/artimage/${item.email}/art/expand/${item.dockey}.jpg",
                              width: double.infinity,
                              height: 600,
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
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          Util.chageText(item.artArtist),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 23,
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
                    aspectRatio: 16 / 12,
                    autoPlayInterval: const Duration(seconds: 5),
                    viewportFraction: 1.0,
                  ),
                );
              }
            }
            return Text("111");
          },
        )),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                          _artInfoController.type.value = _selectedValue.key;
                          _artInfoController.refreshData();
                          // state2.getUser();
                          // print(_selectedValue.key);
                          //  });
                        },
                      ),
                    ),
                    const Row(
                      children: [
                        Text("Filter"),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.filter_1_outlined)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: _artInfoController.getArtList(),
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  if (snapshot.hasError){
                    return const Center(
                      child: Text("Connection Error"),
                    );
                  }else{
                      return Obx(
                        ()=> MasonryGridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.length,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: ResponsiveBreakpoints.of(context).isMobile ? 2 : 3),
                          itemBuilder: (context, index){
                            ArtList item = snapshot.data[index];
                            String url = Util.makeMainArtListURL(item.email, item.artImgFilename);
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
                              onTap: (){
                                Get.to(() => ArtDetailPage(dockey: item.artImgFilename), transition: Transition.fadeIn);
                              },
                              child: Container(
                                // margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: url,
                                      // placeholder: (context, url) =>
                                      //     const CircularProgressIndicator(),
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            art_title,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 13),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            art_artist,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            art_dis,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black.withOpacity(0.5)),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                price,
                                                style: const TextStyle(
                                                    fontSize: 14, fontWeight: FontWeight.bold),
                                              ),
                                              const Row(
                                                children: [
                                                  Icon(
                                                    CustomIcons.icon_artwork_original,
                                                    color: Colors.grey,
                                                    size: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    CustomIcons.icon_artwork_vr,
                                                    color: Colors.grey,
                                                    size: 18,
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

class ValueOptions {
  final String key;
  final String title;

  ValueOptions(this.key, this.title);

  static List<ValueOptions> get allValuesOptions => [
        ValueOptions("random", "랜덤정렬"),
        ValueOptions("date", "최신순"),
        ValueOptions("priceu", "높은 가격순"),
        ValueOptions("priced", "낮은 가격순"),
      ];
}
