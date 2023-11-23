import 'package:flutter/cupertino.dart';
import 'package:gallery360/draw/drawScreen.dart';
import 'package:gallery360/pages/search/model/artist_category_model.dart';
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

  final List<ArtistCategoryModel> SearchArtistCategory = <ArtistCategoryModel>[].obs;

  final int _limit = 20;
  var hasMore = true.obs;
  var artist_page = 1.obs;
  var isLoadingComplete = false.obs;
  var totalSearchCount = 0.obs;

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

      if (tcount > 0){
        for (int k = 0; k < keys.length; k++){
          String key = keys[k]['key'];
          if (key == "art"){
            //작품 검색 결과를 리스트업 한다.
            List<dynamic> artlist = res['aggregations']['by_district']['buckets'][k]['tops']['hits']['hits'];
            List<ArtModel> rx1 = artlist.map<ArtModel>((json) => ArtModel.fromJson(json)).toList();
            SearchArtResult.addAll(rx1);
            SearchArtTotalCount.value = res['aggregations']['by_district']['buckets'][k]['doc_count'];
          }else if (key == "user"){
            //작가 검색 결과 리스트업 한다.
            List<dynamic> artistlist = res['aggregations']['by_district']['buckets'][k]['tops']['hits']['hits'];
            List<ArtistModel> rx3 = artistlist.map<ArtistModel>((json) => ArtistModel.fromJson(json)).toList();
            SearchArtistResult.addAll(rx3);
            SearchArtistTotalCount.value = res['aggregations']['by_district']['buckets'][k]['doc_count'];
          }else if (key == "news"){
            //뉴스관련 검색 결과 리스트업 한다.
            List<dynamic> newslist = res['aggregations']['by_district']['buckets'][k]['tops']['hits']['hits'];
            List<NewsModel> rx2 = newslist.map<NewsModel>((json) => NewsModel.fromJson(json)).toList();
            SearchNewsResult.addAll(rx2);
            SearchNewsTotalCount.value = res['aggregations']['by_district']['buckets'][k]['doc_count'];
          }else if (key == "vr"){
            //VR갤러리 검색 결과 리스트업 한다.
            List<dynamic> vrgallerylist = res['aggregations']['by_district']['buckets'][k]['tops']['hits']['hits'];
            List<VrGalleryModel> rx4 = vrgallerylist.map<VrGalleryModel>((json) => VrGalleryModel.fromJson(json)).toList();
            SearchVrGallyResult.addAll(rx4);
            SearchVrGalleryTotalCount.value = res['aggregations']['by_district']['buckets'][k]['doc_count'];
          }
        }
      }
      searchcomplete.value = true;
    }catch(e){
     // return <ArtModel>[];
      e.printError();
    }
  }

  Future getSearchCategory(String opt) async{
    try{
      if (artist_page.value == 1){
        SearchArtistCategory.clear();
      }
      String query = searchquery.text;
      var res = await _searchRepository.LoadSearchCategory(query, opt, artist_page.value, _limit);

      if (opt == "user"){
        List<dynamic> artistlist = res['hits']['hits'];
        totalSearchCount.value = res['hits']['total'];
        List<ArtistCategoryModel> rx1 = artistlist.map<ArtistCategoryModel>((json) => ArtistCategoryModel.fromJson(json)).toList();
        if (rx1.length < _limit){
          hasMore.value = false;
        }
        SearchArtistCategory.addAll(rx1);
        artist_page.value++;
        isLoadingComplete.value = true;
      }
    }catch(e){
      e.printError();
    }
  }
}