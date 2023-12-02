import 'dart:core';
import 'package:dio/dio.dart';
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

  Future<dynamic> loadImageList(int page, int limit, String sort) async {
    try {
      int px = page - 1;
      if (page > 1) {
        px = (page - 1) * limit;
      }
      if (sort == "") {
        sort = "random";
      }
      String url =
          "${base_url}/all_image_list.mon?start=$px&perpage=$limit&sort=$sort";

      print(url);
      //  print("query : ${color}");

      final response = await dio.get(url);

      List<dynamic> data = response.data;
      data = data.sublist(1, data.length); //첫번째 totalcount json데이터를 제거한다.
      return data;
    } catch (e) {
      e.printError();
    }
  }

  Future<dynamic> loadImageList_Option(int page, int limit, String sort, theme,
      color, shape, size, range) async {
    try {
      int px = page - 1;
      if (page > 1) {
        px = (page - 1) * limit;
      }
      if (sort == "") {
        sort = "random";
      }
      String url = "$base_url/load_image_select_option.mon";
      print(url);
      final response = await dio.post(url,
          data: {
            'start': px,
            'perpage': limit,
            'sort': sort,
            'color': color,
            'hosu': size,
            'price': range,
            'thema': theme,
            "type": shape
          },
          options: Options(
            contentType: 'application/json; charset=UTF-8',
          ));

      List<dynamic> data = response.data;
      data = data.sublist(1, data.length); //첫번째 totalcount json데이터를 제거한다.
      return data;
    } catch (e) {
      e.printError();
    }
  }

  Future<dynamic> ArtRequestSave(
      String subject,
      String name,
      String email,
      String tel,
      String art_code,
      String art_artist,
      String art_title,
      String content) async {
    try {
      String url = "$base_url/art_qu_save.mon";
      final response = await dio.post(url,
          data: {
            'subjet': subject,
            'name': name,
            'email': email,
            'tel': tel,
            'art_code': art_code,
            'art_artist': art_artist,
            'art_title': art_title,
            "content": content
          },
          options: Options(
            contentType: 'application/json; charset=UTF-8',
          ));
      return "OK";
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
