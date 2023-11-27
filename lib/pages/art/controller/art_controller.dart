
import 'dart:convert';


import 'package:gallery360/pages/art/repository/art_repository.dart';
import 'package:get/get.dart';

import '../model/art_detail.dart';
import '../model/art_in_artist.dart';
import '../model/art_in_artlist.dart';
import '../model/art_list_model.dart';
import '../model/art_monthly_list.dart';

class ArtInfoController extends GetxController{
  final ArtRepository _artRepository = ArtRepository();
  var monthlyart = <ArtMonth>[].obs;
  var loadComplete_monthlyart = false.obs;
  final int _limit = 15;

  //작품가져오기
  var artinfolist = <ArtList>[].obs;
  var hasMore_art = true.obs;
  var page_art = 1.obs;
  var type = "".obs;
  var dataLoadingComplete_artlistInfo = false.obs;

  //작품 클릭하고 들어가서 참조하는 변수들
  var select_art_key = "".obs;
  var artinfo = ArtInfo();
  var dataLoadingComplete_artinfo = false.obs;

  //작품 클릭하고 들어간 작가 정보 가져오기
  var artinartist = ArtinArtist();
  var dataLoadingComplete_artinartist = false.obs;

  //작품 클릭하고 들어간 작가의 다른 작품 리스트 가져오기
  var artinarts = <ArtInArt>[].obs;
  var dataLoadingComplete_artinarts = false.obs;

  //작품 메인 화면 Carousel 이미지 가져오기
  Future getArtMainMonly() async{
    List<dynamic> response = await _artRepository.loadMonthlyArt();
    List<ArtMonth> rx = response.map<ArtMonth>((json) => ArtMonth.fromJson(json)).toList();
    monthlyart.addAll(rx);
    loadComplete_monthlyart.value = true;
  }

  //작품 메인 하단 작품 리스트 가져오기
  Future getArtList() async{
    String ty = type.toString();
    List<dynamic> response = await _artRepository.loadImageList(page_art.value, _limit, ty);
    List<ArtList> rx = response.map<ArtList>((json) => ArtList.fromJson(json)).toList();
    if (rx.length < _limit){
      hasMore_art.value = false;
    }
    artinfolist.addAll(rx);
    page_art.value++;
    dataLoadingComplete_artlistInfo.value = true;
    return artinfolist;
  }

  Future refreshData() async {
    page_art.value = 1;
    dataLoadingComplete_artlistInfo.value = false;
    hasMore_art.value = true;
    artinfolist.value = <ArtList>[];
    await getArtList();
  }

  //작품 클릭하고 들어가서 작품 정보 가져오기
  Future getArtInfo() async{
    dataLoadingComplete_artinfo.value = false;
    var response = await _artRepository.SelectArtInfo(select_art_key.value);
    artinfo = ArtInfo.fromJson(response);
    dataLoadingComplete_artinfo.value = true;
  }

  Future getArtInfo2() async{
    dataLoadingComplete_artinfo.value = false;
    var response = await _artRepository.SelectArtInfo(select_art_key.value);
    artinfo = ArtInfo.fromJson(response);
    return artinfo;
  }

  //작품 클릭하고 들어가서 작가 정보 가져오기
  Future getArtInArtist(String email) async{
    dataLoadingComplete_artinartist.value = false;
    var response = await _artRepository.ArtInArtistInfo(email);
    artinartist = ArtinArtist.fromJson(response);
    dataLoadingComplete_artinartist.value = true;
  }

  //작품 클릭하고 들어가서 작가의 작품 정보 가져오기
  Future getArtInArts(String email) async{
    try{
      //dataLoadingComplete_artinarts.value = false;
      List<dynamic> response = await _artRepository.loadImageListInnerArt(email);
      List<ArtInArt> rx = response.map<ArtInArt>((json) => ArtInArt.fromJson(json)).toList();
      //artinarts.addAll(rx);
      print(rx.length);
      return rx;  //FuterBuilder로 받아야 한다.

      // dataLoadingComplete_artinarts.value = true;
    }catch(e){
      e.printError();
    }

  }


}