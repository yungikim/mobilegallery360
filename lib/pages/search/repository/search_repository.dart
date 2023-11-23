import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import '../../../const/const.dart';


class SearchRepository extends GetConnect{

  SearchRepository(){
    allowAutoSignedCert = true;
    timeout = const Duration(seconds: 30);
  }

  final Dio dio = Dio();

  Future<dynamic> LoadSearch(query) async{
    //print(Search_Url.replaceFirst("query", query));
    var response = await dio.get(Search_Url.replaceFirst("query", query));
    final data = response.data;
   // print(data);
    return data;
  }

  Future<dynamic> LoadSearchCategory(String query, String opt, int page, int limit) async{
    try{
      int px = page - 1;
      if (page > 1){
        px = (page - 1) * limit;
      }
      String url = SearchCategory_Url.replaceFirst("query",query).replaceFirst("-perpage-", limit.toString()).replaceFirst("-opt-", opt).replaceFirst("-start-", px.toString());
      print(url);
      var response = await dio.get(url);
      final data = response.data;
      return data;
    }catch(e){
      return
      e.printError();
    }

  }
}