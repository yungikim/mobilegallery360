import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../const/const.dart';
import '../models/data_model.dart';
import '../models/vr_model.dart';

class DataConnectionRepository extends GetConnect{
  final dio = Dio();
  Future<dynamic> loadFirstArtDatWidthDio() async{
    var response = await dio.get(MainPage_ArtList_URL);
    List<dynamic> rbody = response.data;
    List<DataModel> dataList = rbody.map<DataModel>((json) => DataModel.fromJson(json)).toList();
    return dataList;
  }

  Future<dynamic> LoadVRDataWidthDio() async{
    var response = await dio.get(MainPage_VR_URL);
    List<dynamic> rbody = response.data;
    List<VRModel> vrList = rbody.map<VRModel>((json) => VRModel.fromJson(json)).toList();
    return vrList;
  }
}


