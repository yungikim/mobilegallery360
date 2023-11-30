
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/models/vr_model.dart';
import 'package:gallery360/pages/vrgallery/repository/vrrepository.dart';
import 'package:get/get.dart';

class VrController extends GetxController{
  var mainvrs = <MainVR>[].obs;
  var svrs = <VRModel>[].obs;

  var activeIndex = 0.obs;
  var activeIndex2 = 0.obs;
  
  Future MakeMainVrs() async{

    mainvrs.value = <MainVR>[];

    MainVR m1 = MainVR(url: "${base_url}/img/vrgallery/sample_12.jpg", title: "이선화(Lee, sunhwa) 개인전", space: "Gallery The Chai", dockey: "gallery360@gallery360.co.kr_20191120151555_87NHWA4");
    mainvrs.value.add(m1);
    MainVR m2 = MainVR(url: "${base_url}/img/vrgallery/sample_13.jpg", title: "김영미(KIM Young - Mi) 개인전", space: "Gallery360 - K 전시장", dockey: "gallery360@gallery360.co.kr_20191126214717_XKLZSCO");
    mainvrs.value.add(m2);

    return mainvrs.value;
  }

  Future getMainVR() async{
    try{
      svrs.value = <VRModel>[];
      List<VRModel> rx = await VrRepository().Load_Main_VR();
      svrs.addAll(rx.sublist(1));
      return rx.sublist(1);
    }catch(e){
      e.printError();
    }
  }
}

class MainVR{
  String url;
  String title;
  String space;
  String dockey;
  MainVR({required this.url, required this.title, required this.space, required this.dockey});
}