import 'dart:ffi';

import 'package:gallery360/MainPart/screen/widgets/models/data_monthly_artist.dart';
import 'package:gallery360/MainPart/screen/widgets/models/vr_model.dart';
import 'package:get/get.dart';
import '../../../../util/Util.dart';
import '../models/data_model.dart';
import '../models/vr_showmodel.dart';
import '../repository/data_repository.dart';

class DataController extends GetxController{
  var loadingCoplete = false.obs;
  final DataConnectionRepository _dataRepository = DataConnectionRepository();
  var firstPageArtData = <DataModel>[].obs;
  final artListInit = false.obs;
  var vrListData = <VRModel>[].obs;
  final vrListInit = false.obs;
  var monthlyArtist = <MonthlyArtist>[].obs;
  var vrShowlist = <VrShow>[].obs;

  var mainPageRecommandImageURL = "".obs;
  var mainPageRecommandImageTitle = "".obs;
  var mainPageRecommandImageArtist = "".obs;
  var mainPageRecommandImageDockey = "".obs;

  List<String> emails = <String>[].obs;
  List<String> dockeys = <String>[].obs;
  List<String> imageURLs = <String>[].obs;

  Future getFirstPageArtDataCallDio() async{
    try{
      List<DataModel> dataList = await _dataRepository.loadFirstArtDatWidthDio();
     // firstPageArtData.value = dataList;  //호출한 곳에서 callBack을 받아서 상탯 정보에 업데이트 해야 가끔 로딩되지 않는 문제를 해결 할 수 있다.
      return dataList;
    }catch(e){
      e.printError();
    }
  }

  Future getVrListDataCallDio() async{
    try{
      List<VRModel> dataList = await _dataRepository.LoadVRDataWidthDio();

      return dataList;
    }catch(e){
      e.printError();
    }
  }

  Future getArtImage() async{
    try{
      List<DataModel> response = await _dataRepository.loadArtImage();
      firstPageArtData.addAll(response);
      DataModel dm = response[0];
      mainPageRecommandImageURL.value = Util.makeMainArtListURL(dm.email, dm.artImgFilename);
    }catch(e){
      e.printError();
    }
  }

  Future<void> getMonthlyArt() async{
    try{
      List<MonthlyArtist> response = await _dataRepository.loadMonthlyArtist();
      monthlyArtist.addAll(response);
    }catch(e){
      e.printError();
    }
  }

  Future getVrShowList() async{
    try{
      List<VrShow> response = await _dataRepository.loadVrShowList();
    //  vrShowlist.addAll(response);
      return response;
    }catch(e){
      e.printError();
    }
  }


  void dataContollerupdate(){
    update();
  }
}

