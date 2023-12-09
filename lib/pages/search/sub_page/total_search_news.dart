import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:gallery360/pages/search/model/news_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../util/Util.dart';

class TotalSearchNews extends StatelessWidget {
  TotalSearchNews({required this.tab,super.key});
  TabController tab;

  final SearchResultController _searchResultController =
      Get.put(SearchResultController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Visibility(
      visible: _searchResultController.SearchNewsTotalCount.value > 0,
      child: Column(
        children: [
          Container(
            width: width * 0.95,
            height: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "소식",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "(${_searchResultController.SearchNewsTotalCount.value})",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    tab.animateTo(4);
                  },
                  child: const Text(
                    "뉴스 더 보기 >",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _searchResultController.SearchNewsResult.length,
            crossAxisCount: ResponsiveBreakpoints.of(context).isMobile ? 1 : 2,
            itemBuilder: (context, index) {
              NewsModel item = _searchResultController.SearchNewsResult[index];
              Map<String, dynamic> etc = jsonDecode(item.source.etc);
              String url =
                  "${base_url}/artimage/${item.source.email}/news/preview/${etc['filename']}.jpg";
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      //https://www.gallery360.co.kr/index.jsp?ty=link_news&id=155
                      // String url =
                      //     "${base_url}/index.jsp?ty=link_news&id=${item.source.bun}";
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
                              image: NetworkImage(url), fit: BoxFit.cover)),
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
                              fontSize: 16, fontWeight: FontWeight.bold),
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
              );
            },
          ),
        ],
      ),
    );
  }
}
