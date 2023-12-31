import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:gallery360/pages/search/model/art_model.dart';
import 'package:gallery360/pages/search/model/artist_model.dart';
import 'package:gallery360/pages/search/sub_page/total_search_art.dart';
import 'package:gallery360/pages/search/sub_page/total_search_artist.dart';
import 'package:gallery360/pages/search/sub_page/total_search_news.dart';
import 'package:gallery360/pages/search/sub_page/total_search_vr.dart';
import 'package:get/get.dart';

class TotalSeachPage extends StatefulWidget {
  TotalSeachPage({required this.tab, super.key});
  TabController tab;

  @override
  State<TotalSeachPage> createState() => _TotalSeachPageState();
}

class _TotalSeachPageState extends State<TotalSeachPage> {
  final SearchResultController _searchResultController = Get.put(SearchResultController());

  @override
  void initState() {
    String query = _searchResultController.searchquery.text;
   // print("query : ${query}");
    if (query != ""){
      _searchResultController.searchcomplete.value = false;
      _searchResultController.getSearchResult(query);
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SearchResultController _searchResultController =
        Get.put(SearchResultController());

    final width = MediaQuery.of(context).size.width;

    return Obx(() {
      if (_searchResultController.searchcomplete.value) {
        return _searchResultController.totalSearch.value == 0 ? const Center(child: Text("검색결과가 존재하지 않습니다."),) : CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                TotalSearchArtist(tab: widget.tab,),
                const SizedBox(height: 20,),
                TotalSearchArt(tab: widget.tab,),
                const SizedBox(height: 30,),
                TotalSearchVR(tab: widget.tab,),
                const SizedBox(height: 30,),
                TotalSearchNews(tab: widget.tab,),
              ]),
            )
          ],

        );
      } else {
        return _searchResultController.isSearching.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox();
      }
    });
  }
}
