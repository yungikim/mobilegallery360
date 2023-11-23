import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:gallery360/pages/search/model/artist_category_model.dart';
import 'package:gallery360/pages/search/model/artist_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/const.dart';

class ArtistSearchPage extends StatefulWidget {
  const ArtistSearchPage({super.key});

  @override
  State<ArtistSearchPage> createState() => _ArtistSearchPageState();
}

class _ArtistSearchPageState extends State<ArtistSearchPage> {
  final SearchResultController _searchResultController =
      Get.put(SearchResultController());

  late final ScrollController scrollController;

  @override
  void initState() {
    //_searchResultController.getSearchCategory("여름날", "user", "0");
    // TODO: implement initState
    scrollController = ScrollController();
    scrollController.addListener(onScroll);

    String query = _searchResultController.searchquery.text;
    if (query != ""){
      _searchResultController.artist_page.value = 1;
      _searchResultController.isLoadingComplete.value = false;
      _searchResultController.getSearchCategory("user");
    }else{
      _searchResultController.isLoadingComplete.value = true;
    }

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollController.removeListener(onScroll);
    // TODO: implement dispose
    super.dispose();
  }

  void onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double delta = 10.0;

    if (maxScroll == currentScroll && _searchResultController.hasMore.value) {
      _searchResultController.getSearchCategory("user");
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: Obx(() {
        if (_searchResultController.isLoadingComplete.value) {
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                  child: _searchResultController.SearchArtistCategory.length > 0 ? Text(
                    "검색결과 ${_searchResultController.totalSearchCount.value}개",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ) : Text(""),
                ),
              ),
              SliverToBoxAdapter(
                child: MasonryGridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  //   controller: scrollController,
                  itemCount: _searchResultController.SearchArtistCategory.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    ArtistCategoryModel item =
                        _searchResultController.SearchArtistCategory[index];
                    String purl =
                        "${base_url}/artimage/${item.source.email}/photo_list/${item.source.email}_gray.jpg";
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
                          ),
                          //height:  100,
                          //color: Colors.blue,
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(purl),
                                  fit: BoxFit.cover,
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: width - 150,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          "${item.source.name} | ${item.source.nameEng}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            overflow: TextOverflow.clip
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text("작가정보 더보기 >", style: TextStyle(fontSize: 14),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ),

              // SliverToBoxAdapter(
              //   // child: Visibility(
              //   //   visible: !_searchResultController.isLoadingComplete.value,
              //     child: Container(
              //       height: !_searchResultController.isLoadingComplete.value ? 100 : 0,
              //      // color: Colors.red,
              //       child: Center(
              //         child: !_searchResultController.isLoadingComplete.value ? const CircularProgressIndicator() : const SizedBox(),
              //       ),
              //     ),
              //   ),

           //   )
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
    // return FutureBuilder(
    //     future: _searchResultController.getSearchCategory("user"),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done &&
    //           snapshot.hasData) {
    //         List<ArtistCategoryModel> items = _searchResultController.SearchArtistCategory;
    //         return GridView.builder(
    //           shrinkWrap: true,
    //           controller: scrollController,
    //           itemCount: items.length,
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
    //           itemBuilder: (context, index){
    //             ArtistCategoryModel item = items[index];
    //             return Container(
    //               height: 50,
    //               child: Text("${item.source.nickname}"),
    //             );
    //           },
    //         );
    //
    //         // return CustomScrollView(
    //         //
    //         //   controller: scrollController,
    //         //   slivers: [
    //         //     SliverList.builder(
    //         //       itemCount: _searchResultController.hasMore.value ? items.length + 1 : items.length,
    //         //       itemBuilder: (context, index){
    //         //         ArtistCategoryModel item = items[index];
    //         //         if (index < items.length){
    //         //           return Container(
    //         //             margin: const EdgeInsets.all(10),
    //         //             height: 200,
    //         //             color: Colors.red,
    //         //             child: Text(item.source.nickname, style: const TextStyle(fontSize: 50),),
    //         //           );
    //         //         }else {
    //         //           return const Center(
    //         //             child: CircularProgressIndicator(),
    //         //           );
    //         //         }
    //         //       },
    //         //     ),
    //         //   ],
    //         // );
    //       } else if (snapshot.hasError) {
    //         return const Center(
    //           child: Text('Initialization Failed'),
    //         );
    //       } else {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     },

    //);

    // return Obx(() {
    //   if (_searchResultController.searchcomplete.value) {
    //     return FutureBuilder(
    //       child: CustomScrollView(
    //         slivers: [
    //           SliverList.builder(
    //             itemCount: _searchResultController.SearchArtistCategory.length,
    //             itemBuilder: (context, index){
    //               ArtistCategoryModel item = _searchResultController.SearchArtistCategory[index];
    //               return Text(item.source.nickname);
    //             },
    //           ),
    //         ],
    //       ),
    //     );
    //   } else {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }
    // });
  }
}
