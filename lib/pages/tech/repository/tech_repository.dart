import 'package:dio/dio.dart';
import 'package:gallery360/const/const.dart';
import 'package:get/get.dart';

class techRepository extends GetConnect {
  Dio dio = Dio();

  Future loadNewsData(String id) async {
    String url = "$base_url/news_detail_info.mon?bun=$id";
    var response = await dio.get(url);
    return response.data;
  }
}
