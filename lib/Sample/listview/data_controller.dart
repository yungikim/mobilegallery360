import 'package:get/get.dart';
import 'data_model.dart';
import 'data_repository.dart';

class DataController extends GetxController{
  final DataConnectionRepository _dataRepository = DataConnectionRepository();
  var firstPageArtData = <DataModel>[].obs;
  String url = "https://www.gallery360.co.kr/monthly_image_list.mon";

  Future getFirstPageArtDataCallDio() async{
    try{
      List<DataModel> dataList = await _dataRepository.loadFirstArtDatWidthDio();
      firstPageArtData.value = dataList;
    }catch(e){
      e.printError();
    }
  }
}

