import 'package:gallery360/MainPart/screen/widgets/models/vr_model.dart';
import 'package:get/get.dart';
import '../models/data_model.dart';
import '../repository/data_repository.dart';

class DataController extends GetxController{
  final DataConnectionRepository _dataRepository = DataConnectionRepository();
  var firstPageArtData = <DataModel>[].obs;
  var vrListData = <VRModel>[].obs;

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
}

