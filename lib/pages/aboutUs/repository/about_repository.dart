import 'package:dio/dio.dart';
import 'package:gallery360/const/const.dart';
import 'package:get/get.dart';

class AboutRepository extends GetConnect{

  Dio dio = Dio();

  Future loadAboutUs() async{
    var url = "${base_url}/load_all_user_public.mon?opt=2";
    var response = await dio.get(url);
    return response.data;
  }
}