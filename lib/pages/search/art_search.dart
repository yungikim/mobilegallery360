import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:gallery360/pages/search/model/art_category_model.dart';
import 'package:get/get.dart';
import '../../util/Util.dart';
import '../art/art_detail.dart';

class ArtSearchPage extends StatefulWidget {
  const ArtSearchPage({super.key});

  @override
  State<ArtSearchPage> createState() => _ArtSearchPageState();
}

class _ArtSearchPageState extends State<ArtSearchPage> {
  final SearchResultController _searchResultController =
      Get.put(SearchResultController());
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(onScroll);
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

  void onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    double delta = 10.0;
    if (maxScroll == currentScroll && _searchResultController.hasMore_art.value) {
      _searchResultController.getSearchCategory("art");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (_searchResultController.isLoadingComplete_art.value) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 20),
                  child: _searchResultController.SearchArtCategory.isNotEmpty
                      ? Text(
                          "검색결과 ${_searchResultController.totalSearchCount_art.value}개",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      : const Text(""),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MasonryGridView.builder(
                    shrinkWrap: true,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _searchResultController.SearchArtCategory.length,
                    gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index){
                      ArtCategory item = _searchResultController.SearchArtCategory[index];
                      String url =
                      Util.makeMainArtListURL(item.source.email, item.source.id);
                      Map<String, dynamic> tx = jsonDecode(item.source.etc);
                      String art_title = Util.chageText(tx['art_title']);
                      String art_artist = tx['art_artist'];
                      String width = tx['art_width'];
                      String height = tx['art_height'];
                      int hosu = tx['art_hosu'];
                      String art_dis = "${height}x$width($hosu호)";
                      String opt = item.source.opt;
                      String price = opt == "none" ? "가격문의" : "￦${Util.addComma(tx['art_price'] / 10000)}만원";
                      return GestureDetector(
                        onTap: (){
                          Get.to(() => ArtDetailPage(dockey: item.id), transition: Transition.rightToLeft);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.withOpacity(0.4)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: url,
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(art_title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),),
                                    const SizedBox(height: 5,),
                                    Text(art_artist, style: TextStyle(fontSize: 12),),
                                    const SizedBox(height: 5,),
                                    Text(art_dis, style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5)),),
                                    const SizedBox(height: 7,),
                                    Text(price, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
      }),
    );
  }
}
