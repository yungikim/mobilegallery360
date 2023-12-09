import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:gallery360/pages/search/model/news_category_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../const/const.dart';
import '../../util/Util.dart';

class NewSearchPage extends StatefulWidget {
  const NewSearchPage({super.key});

  @override
  State<NewSearchPage> createState() => _NewSearchPageState();
}

class _NewSearchPageState extends State<NewSearchPage> {
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
    if (maxScroll == currentScroll &&
        _searchResultController.hasMore_news.value) {
      _searchResultController.getSearchCategory("news");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (_searchResultController.isLoadingComplete_news.value) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 8, right: 8, bottom: 20),
                  child: _searchResultController.SearchNewsCategory.isNotEmpty
                      ? Text(
                          "검색결과 ${_searchResultController.totalSearchCount_news.value}개",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      : Text(""),
                ),
              ),
              SliverToBoxAdapter(
                child: MasonryGridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: _searchResultController.SearchNewsCategory.length,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ResponsiveBreakpoints.of(context).isMobile ? 1 : 2,
                  ),
                  itemBuilder: (context, index) {
                    NewsCategory item =
                        _searchResultController.SearchNewsCategory[index];
                    Map<String, dynamic> etc = jsonDecode(item.source.etc);
                    String url =
                        "${base_url}/artimage/${item.source.email}/news/preview/${etc['filename']}.jpg";
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.4)),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // var url =
                                //     "$base_url/index.jsp?ty=link_news&id=${item.source.bun}";
                                // Util.UrlOpenWebview(url, "");
                                Map<String, dynamic> jj = jsonDecode(item.source.etc);
                                String url =
                                    "${base_url}/main/news/main_news_mobile.jsp?bun=${item.source.bun}";
                                // print(url);
                                Util.UrlOpenWebview(url, jj['title']);
                              },
                              child: Container(
                                height: 300,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(url),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Util.chageText(etc['title']),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    Util.chageText(etc['tag']),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.7)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
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
