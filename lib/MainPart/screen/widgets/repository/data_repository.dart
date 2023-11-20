import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gallery360/MainPart/screen/widgets/main_monthly_artist.dart';
import 'package:gallery360/MainPart/screen/widgets/main_vrshowlist.dart';
import 'package:gallery360/MainPart/screen/widgets/models/data_monthly_artist.dart';
import 'package:get/get.dart';
import '../../../../const/const.dart';
import '../models/data_model.dart';
import '../models/vr_model.dart';
import '../models/data_monthly_artist.dart';
import '../models/vr_showmodel.dart';

class DataConnectionRepository extends GetConnect{
  DataConnectionRepository(){
    allowAutoSignedCert = true;
    timeout = const Duration(seconds: 30);
  }

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

  Future<List<DataModel>> loadArtImage() async{
    try{
      final response = await get(MainPage_ArtList_URL);
      final data = response.body;
      return List<DataModel>.from(data.map((e) => DataModel.fromJson(e)));
    }catch(e){
      e.printError();
      return <DataModel>[];
    }
  }

  Future<List<MonthlyArtist>> loadMonthlyArtist() async{
    var response = await dio.get(MainPage_Month_Artist_URL);
    List<dynamic> responseMap = response.data;
    List<MonthlyArtist> res = responseMap.map((json) => MonthlyArtist.fromJson(json)).toList();
    return res;
  }

  Future<List<VrShow>> loadVrShowList() async{
    var response = await dio.get(MainPage_VrShow_URL);
    List<dynamic> responseMap = response.data['lending'];
    List<VrShow> res = responseMap.map((json) => VrShow.fromJson(json)).toList();
    return res;
  }

  Future<int> loadArtistCount() async{
    var response = await dio.get(MainPage_Artist_Count);
    print(MainPage_Artist_Count);
    print(jsonDecode(response.toString())['count']);
    //List<dynamic> responseMap = response.data;
    //print(responseMap);
    int res = jsonDecode(response.toString())['count'];
    return res;
  }

}


