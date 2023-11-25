import 'package:gallery360/pages/artist/model/artist_detail.dart';
import 'package:gallery360/pages/artist/repository/artist_repository.dart';
import 'package:get/get.dart';
import '../model/artist_model_search.dart';
import '../model/artist_model.dart';

class ArtistController extends GetxController{
  final ArtistRepository _artistRepository = ArtistRepository();
  final int _limit = 15;
  int _page = 1;
  var hasMore = true.obs;
  var artists = <ArtistModel>[].obs;
  var type = "1".obs;
  var artistInfo = ArtistDetail(nickname: "").obs;

  var artists_search = <ArtistModelSearch>[].obs;

  var dataLoadingComplete = false.obs;
  var dataLoadingComplete_detail = false.obs;
  var isSearch = false.obs;

  //Detail Page
  var selectEmail = "".obs;


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
      print("111111");
      List<dynamic> response = await _artistRepository.searchUsers(_page, _limit, ty, query);
      print(response);
      List<ArtistModel> rx = response.map<ArtistModel>((json) => ArtistModel.fromJson(json)).toList();
      print(rx);
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



  //
  // Future getArtist() async {
  //   try {
  //     print("getUser ..............");
  //     String ty = type.toString();
  //     print("type : $ty");
  //
  //     List<ArtistModel> response = await _artistRepository.fetchUsers(_page, _limit, ty);
  //     if (response.length < _limit) {
  //       hasMore.value = false;
  //     }
  //
  //     print("response.length : ${response.length}");
  //     artists.addAll(response.sublist(1, response.length));
  //     //    users.addAll(response);
  //     _page++;
  //     dataLoadingComplete.value = true;
  //   } catch (e) {
  //     e.printError();
  //   }
  // }
  //
  //
  // Future searchUser(String query) async {
  //   try {
  //     String ty = type.toString();
  //     List<ArtistModel> response =
  //     await _artistRepository.searchUsers(_page, _limit, ty, query);
  //     if (response.length < _limit) {
  //       hasMore.value = false;
  //     }
  //
  //     print("Search length : ${response.length}");
  //     artists.addAll(response.sublist(1, response.length));
  //     print(response);
  //     _page++;
  //     dataLoadingComplete.value = true;
  //   } catch (e) {
  //     e.printError();
  //   }
  // }

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
}