import 'package:dio/dio.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/artist/model/artist_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ArtistRepository extends GetConnect{
  ArtistRepository(){
    allowAutoSignedCert = true;
    timeout = const Duration(seconds: 30);
  }

  final Dio dio = Dio();

  // Future<List<ArtistModel>> fetchUsers(int page, int limit, String type) async {
  //   try {
  //     int px = page - 1;
  //     if (page > 1) {
  //       px = (page - 1) * limit;
  //     }
  //     String url = "${base_url}/load_artist_public.mon?start=$px&perpage=$limit&ty=$type";
  //     final response = await get(url);
  //     print(Uri.parse(url));
  //     final data = response.body;
  //     return List<ArtistModel>.from(data.map((e) => ArtistModel.fromJson(e)));
  //   } catch (e) {
  //     e.printError();
  //     return <ArtistModel>[];
  //   }
  // }
  //
  // Future<List<ArtistModel>> searchUsers(
  //     int page, int limit, String type, String query) async {
  //   try {
  //     int px = page - 1;
  //     if (page > 1) {
  //       px = (page - 1) * limit;
  //     }
  //     px = 0;
  //     String url = "${base_url}/search_artist_public.mon?q=$query&start=$px&perpage=$limit&ty=0";
  //     final response = await get(url);
  //     final data = response.body;
  //     return List<ArtistModel>.from(data.map((e) => ArtistModel.fromJson(e)));
  //   } catch (e) {
  //     e.printError();
  //     return <ArtistModel>[];
  //   }
  // }

  Future<dynamic> fetchUsers(int page, int limit, String type) async {
    try {
      int px = page - 1;
      if (page > 1) {
        px = (page - 1) * limit;
      }
      String url = "${base_url}/load_artist_public.mon?start=$px&perpage=$limit&ty=$type";
      final response = await dio.get(url);
      print(Uri.parse(url));
      List<dynamic> data = response.data;
      data = data.sublist(1,data.length);   //첫번째 totalcount json데이터를 제거한다.
      return data;
    } catch (e) {
      e.printError();
    }
  }

  Future<dynamic> searchUsers(
      int page, int limit, String type, String query) async {
    try {
      int px = page - 1;
      if (page > 1) {
        px = (page - 1) * limit;
      }
      px = 0;
      String url = "${base_url}/search_artist_public.mon?q=$query&start=$px&perpage=$limit&ty=0";
      print(Uri.parse(url));
      final response = await dio.get(url);
      List<dynamic> data = response.data;
      data = data.sublist(1, data.length);
      return data;
    } catch (e) {
      e.printError();
    }
  }

  Future<dynamic> artistDetail(String email) async {
    //try {
    String url = "${base_url}/load_artist_detail_public.mon?email=$email";
    var response2 = await dio.get(url);
    return response2.data;
  }

}