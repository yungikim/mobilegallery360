import 'package:gallery360/pages/artist/model/artist_detail.dart';
import 'package:gallery360/pages/artist/model/detail_art.dart';
import 'package:gallery360/pages/artist/repository/artist_repository.dart';
import 'package:get/get.dart';
import '../model/artist_model_search.dart';
import '../model/artist_model.dart';
import '../model/detail_vr.dart';

class ArtistController extends GetxController{
  final ArtistRepository _artistRepository = ArtistRepository();
  final int _limit = 15;
  int _page = 1;
  var hasMore = true.obs;
  var artists = <ArtistModel>[].obs;
  RxString type = "0".obs;
  var artistInfo = ArtistDetail(nickname: "").obs;
  var artists_search = <ArtistModelSearch>[].obs;
  var dataLoadingComplete = false.obs;
  var dataLoadingComplete_detail = false.obs;
  var isSearch = false.obs;

  //Detail Page
  var current_email = "".obs;
  var detailarts = <DetailArt>[].obs;
  var page_art = 1.obs;
  var hasMore_art = true.obs;
  var dataLoadingComplete_art = false.obs;

  var detailvrs = <DetailVR>[].obs;
  var page_vr = 1.obs;
  var hasMore_vr = true.obs;
  var dataLoadingComplete_vr = false.obs;


  Future getArtist() async{
    isSearch.value = false;
    String ty = type.toString();
    List<dynamic> response = await _artistRepository.fetchUsers(_page, _limit, ty);
    List<ArtistModel> rx = response.map<ArtistModel>((json) => ArtistModel.fromJson(json)).toList();
    if (rx.length < _limit){
      hasMore.value = false;
    }
    artists.addAll(rx);
    _page++;
    dataLoadingComplete.value = true;
  }

  Future searchUser(String query) async{
    try{
      isSearch.value = true;
      String ty = type.toString();
      List<dynamic> response = await _artistRepository.searchUsers(_page, _limit, ty, query);
      List<ArtistModel> rx = response.map<ArtistModel>((json) => ArtistModel.fromJson(json)).toList();
      if (rx.length < _limit){
        hasMore.value = false;
      }
      artists.addAll(rx);
      _page++;
      dataLoadingComplete.value = true;
    }catch(e){
      e.printError();
    }
  }

  Future artistDetail(String email) async{
    try{
      var response = await _artistRepository.artistDetail(email);
      artistInfo.value = ArtistDetail.fromJson(response);
      dataLoadingComplete_detail.value = true;
    }catch(e){
      e.printError();
    }
  }

  Future refreshData() async {
    _page = 1;
    hasMore.value = true;
    artists.value = [];

    await getArtist();
  }


  //Detail Page
  Future getDetailArt() async{
    String email = current_email.value;
    List<dynamic> response = await _artistRepository.detailArt(page_art.value, _limit, email);
    print(response);
    List<DetailArt> rx = response.map<DetailArt>((json) => DetailArt.fromJson(json)).toList();
    print(rx);
    if (rx.length < _limit){
      hasMore_art.value = false;
    }
    detailarts.addAll(rx);
    page_art++;
    dataLoadingComplete_art.value = true;
  }

  Future getDetailVR() async{
    String email = current_email.value;
    List<dynamic> response = await _artistRepository.detailVR(page_vr.value, _limit, email);
    List<DetailVR> rx = response.map<DetailVR>((json) => DetailVR.fromJson(json)).toList();
    if (rx.length < _limit){
      hasMore_vr.value = false;
    }
    detailvrs.addAll(rx);
    page_vr++;
    dataLoadingComplete_vr.value = true;
  }

}