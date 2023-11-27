
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../const/const.dart';

class ArtRepository extends GetConnect{
   ArtRepository(){
    allowAutoSignedCert = true;
    timeout = const Duration(seconds: 30);
  }
  final Dio dio = Dio();

   Future<dynamic> loadMonthlyArt() async {
     try {

       String url = "${base_url}/monthly_image_list.mon";
       final response = await dio.get(url);
       print(Uri.parse(url));
       List<dynamic> data = response.data;
       return data;
     } catch (e) {
       e.printError();
     }
   }

   Future<dynamic> loadImageList(int page, int limit, String sort) async {
     try {
       int px = page - 1;
       if (page > 1) {
         px = (page - 1) * limit;
       }
       if (sort == ""){
         sort = "random";
       }
       String url = "${base_url}/all_image_list.mon?start=$px&perpage=$limit&sort=$sort";
       print(url);
       final response = await dio.get(url);
       List<dynamic> data = response.data;
       data = data.sublist(1,data.length);   //첫번째 totalcount json데이터를 제거한다.
       return data;
     } catch (e) {
       e.printError();
     }
   }

   Future<dynamic> SelectArtInfo(String dockey) async {
     try {
       String url = "${base_url}/select_art_info.mon?dockey=$dockey";
       final response = await dio.get(url);
       print(Uri.parse(url));
       List<dynamic> data = response.data;
       return data;
     } catch (e) {
       e.printError();
     }
   }

   Future<dynamic> ArtInArtInfo(String email) async {
     try {
       String url = "${base_url}/user_search.mon?email=$email";
       final response = await dio.get(url);
       print(Uri.parse(url));
       List<dynamic> data = response.data;
       return data;
     } catch (e) {
       e.printError();
     }
   }


   Future<dynamic> loadImageListInnerArt(String email) async {
     try {
       String url = "${base_url}/load_image_for_artist.mon?start=0&perpage=30&email=$email";
       final response = await dio.get(url);
       print(Uri.parse(url));
       List<dynamic> data = response.data;
       data = data.sublist(1,data.length);   //첫번째 totalcount json데이터를 제거한다.
       return data;
     } catch (e) {
       e.printError();
     }
   }

}