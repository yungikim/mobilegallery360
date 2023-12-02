import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/models/vr_model.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/vr_list.dart';
import 'package:gallery360/pages/art/art_main.dart';
import 'package:gallery360/pages/vrgallery/model/vr_detail_first.dart';
import 'package:gallery360/pages/vrgallery/model/vr_detail_second.dart';
import 'package:gallery360/pages/vrgallery/model/vr_detail_third.dart';
import 'package:gallery360/pages/vrgallery/model/vrmodel.dart';
import 'package:gallery360/pages/vrgallery/repository/vrrepository.dart';
import 'package:get/get.dart';

import '../vr_main.dart';

class VrController extends GetxController {
  var mainvrs = <MainVR>[].obs;
  var svrs = <VRModel>[].obs;

  var activeIndex = 0.obs;
  var activeIndex2 = 0.obs;

  //VR Gallery Main List
  var svrslist = <VRListModel>[].obs;
  var hasMore_vr = true.obs;
  var page_vr = 1.obs;
  var sort_vr = "".obs;
  final int limit = 12;
  var totalcount = 0.obs;
  var currentcount = 0.obs;

  var selectedValue =  ValueOptions_VR("0", "랜덤정렬").obs;

  Future MakeMainVrs() async {
    mainvrs.value = <MainVR>[];

    MainVR m1 = MainVR(
      url: "${base_url}/img/vrgallery/sample_12.jpg",
      title: "이선화(Lee, sunhwa) 개인전",
      space: "Gallery The Chai",
      dockey: "gallery360@gallery360.co.kr_20191120151555_87NHWA4",
      subtitle: "‘Spiritual harmony '생명순환'’",
    );
    mainvrs.value.add(m1);
    MainVR m2 = MainVR(
      url: "${base_url}/img/vrgallery/sample_9.jpg",
      title: "이문자(Lee munja) 개인전",
      space: "Home_ A 전시장",
      dockey: "mun321m@naver.com_20191118113105_CZUE42C",
      subtitle: "‘봄의 소리’"
    );
    mainvrs.value.add(m2);
    m2 = MainVR(
        url: "${base_url}/img/vrgallery/sample_13.jpg",
        title: "김영미(KIM Young - Mi) 개인전",
        space: "Gallery360 - K 전시장",
        dockey: "gallery360@gallery360.co.kr_20191126214717_XKLZSCO",
        subtitle: "‘부조리한 인간들_ '우화(寓話)' 시리즈’"
    );
    mainvrs.value.add(m2);
    m2 = MainVR(
        url: "${base_url}/img/vrgallery/sample_10.jpg",
        title: "이희춘 (Lee Hie Chun) 개인전",
        space: "Belarus minsk A&V Gallery",
        dockey: "gallery360@gallery360.co.kr_20191205095123_H2JHELW",
        subtitle: "‘몽유화원(夢遊花園) : 신의 정원’"
    );
    mainvrs.value.add(m2);
    m2 = MainVR(
        url: "${base_url}/img/vrgallery/sample_14.jpg",
        title: "오승경(Seungkyung Oh) 개인전",
        space: "Gallery360 - A 전시장",
        dockey: "seukyuoh@gmail.com_20200309144204_JDAVUOG",
        subtitle: "‘환상과 도피의 유토피아’"
    );
    mainvrs.value.add(m2);

    return mainvrs.value;
  }

  Future getMainVR() async {
    try {
      svrs.value = <VRModel>[];
      List<VRModel> rx = await VrRepository().Load_Main_VR();
      svrs.addAll(rx.sublist(1));
      return rx.sublist(1);
    } catch (e) {
      e.printError();
    }
  }

  Future getMainVRList() async {
    try {
      List<dynamic> response = await VrRepository()
          .Load_Main_VR_List(page_vr.value, sort_vr.value, limit);
      List<VRListModel> rx = response
          .map<VRListModel>((json) => VRListModel.fromJson(json))
          .toList();
      if (rx.length < limit) {
        hasMore_vr.value = false;
      }
      svrslist.addAll(rx);
      currentcount.value = svrslist.length;
      page_vr.value++;
      return svrslist;
    } catch (e) {
      e.printError();
    }
  }

  Future refreshData() async {
    page_vr.value = 1;
    hasMore_vr.value = true;
    svrslist.value = <VRListModel>[];
    await getMainVRList();
  }

  //VR Detail Page Refenence

  var selectKey = "".obs;
  var selectEmail = "".obs;

  var vrfirst = VrDetailFirst();
  var vrsecond = <VrDetailSecond>[];
  var vrthird = <VrDetailThird>[];

  // Future getAllLoad() async{
  //   getVrDetailFirst(selectKey.value.toString());
  //   getVrDetailSecond(email)
  //   getVrDetailThird(email);
  //   getVrRead();
  // }

  Future getVrDetailFirst() async{
    try{
      var response = await VrRepository().Load_VR_Detail_First(selectKey.value.toString());
      vrfirst = VrDetailFirst.fromJson(response);
      return vrfirst;
    }catch(e){
      e.printError();
    }
  }

  Future getVrDetailSecond(String email) async{
    try{
      var response = await VrRepository().Load_VR_Detail_Second(selectEmail.value.toString());
      List<VrDetailSecond> rx = response.map<VrDetailSecond>((json) => VrDetailSecond.fromJson(json)).toList();
      vrsecond.addAll(rx);
      return vrsecond;
    }catch(e){
      e.printError();
    }
  }

  Future getVrDetailThird(String email) async{
    try{
      var response = await VrRepository().Load_VR_Detail_Thrid(selectEmail.value.toString());
      List<VrDetailThird> rx = response.map((json) => VrDetailThird.fromJson(json)).toList();
      vrthird.addAll(rx);
      return vrthird;
    }catch(e){
      e.printError();
    }
  }

  Future getVrRead(String key) async{
    try{
      var response = await VrRepository().Load_VR_Read(selectKey.value.toString());
    }catch(e){
      e.printError();
    }
  }
}

class MainVR {
  String url;
  String title;
  String space;
  String dockey;
  String subtitle;

  MainVR(
      {required this.url,
      required this.title,
      required this.space,
      required this.dockey,
      required this.subtitle});
}
