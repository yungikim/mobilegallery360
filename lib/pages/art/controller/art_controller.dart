import 'package:flutter/material.dart';
import 'package:gallery360/pages/art/repository/art_repository.dart';
import 'package:get/get.dart';
import '../model/art_detail.dart';
import '../model/art_in_artist.dart';
import '../model/art_in_artlist.dart';
import '../model/art_list_model.dart';
import '../model/art_monthly_list.dart';

class ArtInfoController extends GetxController {
  final ArtRepository _artRepository = ArtRepository();
  var monthlyart = <ArtMonth>[].obs;
  var loadComplete_monthlyart = false.obs;
  final int _limit = 15;

  var isSearch = false.obs;

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

  //필터 검색용 참고변수
  var query_thema = [].obs;
  var query_color = [].obs;
  var query_shape = [].obs;
  var query_size = [].obs;
  var query_price = RangeValues(0, 0).obs;
  var query_dis = [].obs;

  //작품 문의등록 할 경우 사용하는 변수
  var subject = "".obs;
  var name = "".obs;
  var email = "".obs;
  var tel = "".obs;
  var art_code = "".obs;
  var art_artist = "".obs;
  var art_title = "".obs;
  var content = "".obs;

  var persistenHeight = 70.obs;

  //작품 메인 화면 Carousel 이미지 가져오기
  Future getArtMainMonly() async {
    List<dynamic> response = await _artRepository.loadMonthlyArt();
    List<ArtMonth> rx =
        response.map<ArtMonth>((json) => ArtMonth.fromJson(json)).toList();
    monthlyart.addAll(rx);
    loadComplete_monthlyart.value = true;
  }

  //작품 메인 하단 작품 리스트 가져오기
  Future getArtList() async {
    String ty = type.toString();
    List<dynamic> response =
        await _artRepository.loadImageList(page_art.value, _limit, ty);
    List<ArtList> rx =
        response.map<ArtList>((json) => ArtList.fromJson(json)).toList();
    if (rx.length < _limit) {
      hasMore_art.value = false;
    }
    artinfolist.addAll(rx);
    page_art.value++;
    dataLoadingComplete_artlistInfo.value = true;
    return artinfolist;
  }

  //작품 메인 하단 작품 리스트 가져오기 카테고리 검색을 실행한 경우
  Future getArtList_option(String opt) async {
    if (opt == "T") {
      artinfolist.value = <ArtList>[];
    }

    String ty = type.toString();
    //옵션을 지정한다.
    String color = query_color.join("-spl-").replaceAll("_", "");
    String theme = query_thema.join("-spl-");
    String shape = query_shape.join("-spl-");
    String size = query_size.join("-spl-");
    String range = "";

    if (query_price.value.start.toString() != "0.0" &&
        query_price.value.end.toString() != "0.0") {
      range =
          "${query_price.value.start.toInt() * 10000}-spl-${query_price.value.end.toInt() * 10000}";
    }

    List<dynamic> response = await _artRepository.loadImageList_Option(
        page_art.value, _limit, ty, theme, color, shape, size, range);
    List<ArtList> rx =
        response.map<ArtList>((json) => ArtList.fromJson(json)).toList();
    if (rx.length < _limit) {
      hasMore_art.value = false;
    }
    artinfolist.addAll(rx);
    page_art.value++;
    dataLoadingComplete_artlistInfo.value = true;

    if (query_dis.isEmpty){
      persistenHeight.value = 70;
    }

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
  Future getArtInfo() async {
    dataLoadingComplete_artinfo.value = false;
    var response = await _artRepository.SelectArtInfo(select_art_key.value);
    artinfo = ArtInfo.fromJson(response);
    dataLoadingComplete_artinfo.value = true;
  }

  Future getArtInfo2() async {
    dataLoadingComplete_artinfo.value = false;
    var response = await _artRepository.SelectArtInfo(select_art_key.value);
    artinfo = ArtInfo.fromJson(response);
    return artinfo;
  }

  //작품 클릭하고 들어가서 작가 정보 가져오기
  Future getArtInArtist(String email) async {
    dataLoadingComplete_artinartist.value = false;
    var response = await _artRepository.ArtInArtistInfo(email);
    artinartist = ArtinArtist.fromJson(response);
    dataLoadingComplete_artinartist.value = true;
  }

  //작품 클릭하고 들어가서 작가의 작품 정보 가져오기
  Future getArtInArts(String email) async {
    try {
      //dataLoadingComplete_artinarts.value = false;
      List<dynamic> response =
          await _artRepository.loadImageListInnerArt(email);
      List<ArtInArt> rx =
          response.map<ArtInArt>((json) => ArtInArt.fromJson(json)).toList();
      //artinarts.addAll(rx);
      print(rx.length);
      return rx; //FuterBuilder로 받아야 한다.

      // dataLoadingComplete_artinarts.value = true;
    } catch (e) {
      e.printError();
    }
  }

  Future SaveArtRequest() async {
    try {
      // String subject = subject;
      // String name = "";
      // String email = "";
      // String tel = "";
      // String art_code = "";
      // String art_artist = "";
      // String art_title = "";
      // String content = "";

      var response = await _artRepository.ArtRequestSave(subject.value, name.value,
          email.value, tel.value, art_code.value, art_artist.value, art_title.value, content.value);
      print(response);
    } catch (e) {
      e.printError();
    }
  }
}
