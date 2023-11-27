
import 'package:gallery360/pages/art/repository/art_repository.dart';
import 'package:get/get.dart';

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
}