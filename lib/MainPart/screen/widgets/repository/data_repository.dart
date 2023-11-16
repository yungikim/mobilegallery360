import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../models/data_model.dart';

class DataConnectionRepository extends GetConnect{
  String url = "https://www.gallery360.co.kr/monthly_image_list.mon";
  final dio = Dio();

  Future<dynamic> loadFirstArtDatWidthDio() async{
    print("222222222");
    var response = await dio.get(url);
    print("loadFirstArtDatWidthDio : ${response.statusCode}");
    List<dynamic> rbody = response.data;
    List<DataModel> dataList = rbody.map((e) => DataModel.fromJson(e)).toList();
    return dataList;
  }
}


