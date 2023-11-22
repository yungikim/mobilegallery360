import 'package:gallery360/draw/drawScreen.dart';
import 'package:gallery360/pages/search/repository/search_repository.dart';
import 'package:get/get.dart';
import '../model/art_model.dart';
import '../model/artist_model.dart';
import '../model/news_model.dart';
import '../model/vrgallery_model.dart';

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


  Future<void> getSearchResult(String query) async{
    try{

      SearchArtResult.clear();
      SearchNewsResult.clear();
      SearchArtistResult.clear();
      SearchVrGallyResult.clear();

      var res = await _searchRepository.LoadSearch(query);

      List<dynamic> keys = res['aggregations']['by_district']['buckets'];
      for (int k = 0; k < keys.length; k++){
        String key = keys[k]['key'];
        //print(key);
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

      searchcomplete.value = true;
    }catch(e){
     // return <ArtModel>[];
      e.printError();
    }
  }


  // Future getVrListDataCallDio() async{
  //   try{
  //     List<VRModel> dataList = await _dataRepository.LoadVRDataWidthDio();
  //     return dataList.sublist(1);
  //   }catch(e){
  //     e.printError();
  //   }
  // }
}