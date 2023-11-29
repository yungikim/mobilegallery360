import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery360/pages/art/controller/art_controller.dart';
import 'package:get/get.dart';

import '../../../const/const.dart';

class ArtRepository extends GetConnect {
  ArtRepository() {
    allowAutoSignedCert = true;
    timeout = const Duration(seconds: 30);
  }

  final Dio dio = Dio();

  //final ArtInfoController _artInfoController = Get.put(ArtInfoController());

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

  Future<dynamic> loadImageList(int page, int limit, String sort, color) async {
    try {
      int px = page - 1;
      if (page > 1) {
        px = (page - 1) * limit;
      }
      if (sort == "") {
        sort = "random";
      }
      String url =
          "${base_url}/all_image_list.mon?start=$px&perpage=$limit&sort=$sort&color=$color";
      print(url);
    //  print("query : ${color}");

      final response = await dio.post(url,
          data: {
            'color': color,
            'hosu' : "",
            'price' : "",
            'thema' : "",
            "type" : ""
          },
          options: Options(
            contentType: 'application/json; charset=UTF-8',
          )
          // queryParameters: {
          //   "color" : color,
          // //   // "hosu" : _artInfoController.query_size.value.join(","),
          // //   // "price" : _artInfoController.query_price.value.start.toString() + "~" + _artInfoController.query_price.value.end.toString(),
          // //   // "thema" : _artInfoController.query_thema.value.join(","),
          // //   // "type" : _artInfoController.query_shape.value.join(","),
          // },
          );

      List<dynamic> data = response.data;
      data = data.sublist(1, data.length); //첫번째 totalcount json데이터를 제거한다.
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
      return response.data;
    } catch (e) {
      e.printError();
    }
  }

  Future<dynamic> ArtInArtistInfo(String email) async {
    try {
      String url = "${base_url}/user_search.mon?email=$email";
      print(url);
      final response = await dio.get(url);
      return response.data;
    } catch (e) {
      e.printError();
    }
  }

  Future<dynamic> loadImageListInnerArt(String email) async {
    try {
      String url =
          "${base_url}/load_image_for_artist.mon?start=0&perpage=20&email=$email";
      final response = await dio.get(url);
      List<dynamic> data = response.data;
      return data.sublist(1, data.length); //첫번째 totalcount json데이터를 제거한다.
    } catch (e) {
      e.printError();
    }
  }
}
