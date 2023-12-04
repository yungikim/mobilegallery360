import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:gallery360/pages/search/model/artist_category_model.dart';
import 'package:get/get.dart';
import '../../const/const.dart';
import '../../util/Util.dart';
import '../artist/artist_detail.dart';

class ArtistSearchPage extends StatefulWidget {
  const ArtistSearchPage({super.key});

  @override
  State<ArtistSearchPage> createState() => _ArtistSearchPageState();
}

class _ArtistSearchPageState extends State<ArtistSearchPage> {
  final SearchResultController _searchResultController =
      Get.put(SearchResultController());

  late ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    scrollController.addListener(onScroll);
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
                  padding: const EdgeInsets.only(
                      top: 10, left: 8, right: 8, bottom: 20),
                  child: _searchResultController.SearchArtistCategory.isNotEmpty
                      ? Text(
                          "검색결과 ${_searchResultController.totalSearchCount.value}개",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      : const Text(""),
                ),
              ),
              SliverToBoxAdapter(
                child: MasonryGridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  //   controller: scrollController,
                  itemCount:
                      _searchResultController.SearchArtistCategory.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    ArtistCategoryModel item =
                        _searchResultController.SearchArtistCategory[index];
                    String purl =
                        "$base_url/artimage/${item.source.email}/photo_list/${item.source.email}_gray.jpg";
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.3), width: 1),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          "${Util.chageText(item.source.name)} | ${Util.chageText(item.source.nameEng)}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              overflow: TextOverflow.clip),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Get.to(() => ArtistDetailPage(email: item.source.email),  transition: Transition.rightToLeft);
                                        },
                                        child: const Text(
                                          "작가정보 더보기 >",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
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
