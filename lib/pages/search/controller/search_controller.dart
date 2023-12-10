import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/draw/drawScreen.dart';
import 'package:gallery360/pages/search/model/art_category_model.dart';
import 'package:gallery360/pages/search/model/artist_category_model.dart';
import 'package:gallery360/pages/search/model/news_category_model.dart';
import 'package:gallery360/pages/search/model/vr_category_model.dart';
import 'package:gallery360/pages/search/repository/search_repository.dart';
import 'package:get/get.dart';
import '../model/art_model.dart';
import '../model/artist_model.dart';
import '../model/news_model.dart';
import '../model/vrgallery_model.dart';
import 'package:gallery360/util/Util.dart';

class SearchResultController extends GetxController{

  final SearchRepository _searchRepository = SearchRepository();

  final List<ArtModel> SearchArtResult = <ArtModel>[].obs;
  var SearchArtTotalCount = 0.obs;
  final List<ArtistModel> SearchArtistResult = <ArtistModel>[].obs;
  var SearchArtistTotalCount = 0.obs;
  final List<VrGalleryModel> SearchVrGallyResult = <VrGalleryModel>[].obs;
  var SearchVrGalleryTotalCount = 0.obs;
  final List<NewsModel> SearchNewsResult = <NewsModel>[].obs;
  var SearchNewsTotalCount = 0.obs;
  var searchcomplete = false.obs;
  var isSearching = false.obs;




  final int _limit = 20;

  //artist 변수
  final List<ArtistCategoryModel> SearchArtistCategory = <ArtistCategoryModel>[].obs;
  var hasMore = true.obs;
  var page = 1.obs;
  var isLoadingComplete = false.obs;
  var totalSearchCount = 0.obs;

  //art 변수
  final List<ArtCategory> SearchArtCategory = <ArtCategory>[].obs;
  var hasMore_art = true.obs;
  var page_art = 1.obs;
  var isLoadingComplete_art = false.obs;
  var totalSearchCount_art = 0.obs;

  //vr갤러리 변수
  final List<VRCategory> SearchVRCategory = <VRCategory>[].obs;
  var hasMore_vr = true.obs;
  var page_vr = 1.obs;
  var isLoadingComplete_vr = false.obs;
  var totalSearchCount_vr = 0.obs;

  //news 변수
  final List<NewsCategory> SearchNewsCategory = <NewsCategory>[].obs;
  var hasMore_news = true.obs;
  var page_news = 1.obs;
  var isLoadingComplete_news = false.obs;
  var totalSearchCount_news = 0.obs;

  var totalSearch = 0.obs;

  late final TextEditingController searchquery;



  Future<void> getSearchResult(String query) async{
    try{
      // SearchQuery.value = query;
      SearchArtResult.clear();
      SearchNewsResult.clear();
      SearchArtistResult.clear();
      SearchVrGallyResult.clear();
      SearchVrGalleryTotalCount.value = 0;
      SearchArtTotalCount.value = 0;
      SearchNewsTotalCount.value = 0;
      SearchArtistTotalCount.value = 0;

      var res = await _searchRepository.LoadSearch(query);
      List<dynamic> keys = res['aggregations']['by_district']['buckets'];
      int tcount = res['hits']['total'];
      totalSearch.value = tcount;

      if (tcount > 0) {
        for (int k = 0; k < keys.length; k++) {
          String key = keys[k]['key'];
          if (key == "art") {
            //작품 검색 결과를 리스트업 한다.
            List<
                dynamic> artlist = res['aggregations']['by_district']['buckets'][k]['tops']['hits']['hits'];
            List<ArtModel> rx1 = artlist.map<ArtModel>((json) =>
                ArtModel.fromJson(json)).toList();
            SearchArtResult.addAll(rx1);
            SearchArtTotalCount.value =
            res['aggregations']['by_district']['buckets'][k]['doc_count'];
          } else if (key == "user") {
            //작가 검색 결과 리스트업 한다.
            List<
                dynamic> artistlist = res['aggregations']['by_district']['buckets'][k]['tops']['hits']['hits'];
            List<ArtistModel> rx3 = artistlist.map<ArtistModel>((json) =>
                ArtistModel.fromJson(json)).toList();
            SearchArtistResult.addAll(rx3);
            SearchArtistTotalCount.value =
            res['aggregations']['by_district']['buckets'][k]['doc_count'];
          } else if (key == "news") {
            //뉴스관련 검색 결과 리스트업 한다.
            List<
                dynamic> newslist = res['aggregations']['by_district']['buckets'][k]['tops']['hits']['hits'];
            List<NewsModel> rx2 = newslist.map<NewsModel>((json) =>
                NewsModel.fromJson(json)).toList();
            SearchNewsResult.addAll(rx2);
            SearchNewsTotalCount.value =
            res['aggregations']['by_district']['buckets'][k]['doc_count'];
          } else if (key == "vr") {
            //VR갤러리 검색 결과 리스트업 한다.
            List<
                dynamic> vrgallerylist = res['aggregations']['by_district']['buckets'][k]['tops']['hits']['hits'];
            List<VrGalleryModel> rx4 = vrgallerylist.map<VrGalleryModel>((
                json) => VrGalleryModel.fromJson(json)).toList();
            SearchVrGallyResult.addAll(rx4);
            SearchVrGalleryTotalCount.value =
            res['aggregations']['by_district']['buckets'][k]['doc_count'];
          }
        }
      }else{
        print("검색결과가 존재하지 않습니다.");
      }
      searchcomplete.value = true;
    }catch(e){
     // return <ArtModel>[];
      e.printError();
    }
  }

  Future getSearchCategory(String opt) async{
    try{
      String query = searchquery.text;

      if (opt == "user"){
        var res = await _searchRepository.LoadSearchCategory(query, opt, page.value, _limit);
        List<dynamic> reslist = res['hits']['hits'];
        totalSearchCount.value = res['hits']['total'];
        List<ArtistCategoryModel> rx1 = reslist.map<ArtistCategoryModel>((json) => ArtistCategoryModel.fromJson(json)).toList();
        if (rx1.length < _limit){
          hasMore.value = false;
        }
        SearchArtistCategory.addAll(rx1);
        isLoadingComplete.value = true;
        page.value++;
      }else if (opt == "art"){
        var res = await _searchRepository.LoadSearchCategory(query, opt, page_art.value, _limit);
        List<dynamic> reslist = res['hits']['hits'];
        totalSearchCount_art.value = res['hits']['total'];
        List<ArtCategory> rx2 = reslist.map<ArtCategory>((json) => ArtCategory.fromJson(json)).toList();
        if (rx2.length < _limit){
          hasMore_art.value = false;
        }
        SearchArtCategory.addAll(rx2);
        isLoadingComplete_art.value = true;
        page_art.value++;
      }else if (opt == "vr"){
        var res = await _searchRepository.LoadSearchCategory(query, opt, page_vr.value, _limit);
        List<dynamic> reslist = res['hits']['hits'];
        totalSearchCount_vr.value = res['hits']['total'];
        List<VRCategory> rx3 = reslist.map<VRCategory>((json) => VRCategory.fromJson(json)).toList();
        if (rx3.length < _limit){
          hasMore_vr.value = false;
        }
        SearchVRCategory.addAll(rx3);
        isLoadingComplete_vr.value = true;
        page_vr.value++;
      }else if (opt == "news"){
        var res = await _searchRepository.LoadSearchCategory(query, opt, page_news.value, _limit);
        List<dynamic> reslist = res['hits']['hits'];
        totalSearchCount_news.value = res['hits']['total'];
        List<NewsCategory> rx3 = reslist.map<NewsCategory>((json) => NewsCategory.fromJson(json)).toList();
        if (rx3.length < _limit){
          hasMore_news.value = false;
        }
        SearchNewsCategory.addAll(rx3);
        isLoadingComplete_news.value = true;
        page_news.value++;
      }
    }catch(e){
      e.printError();
    }
  }

}


class MyTabController extends GetxController with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}