import 'package:dio/dio.dart';
import 'package:get/get_connect/connect.dart';
import '../../../const/const.dart';


class SearchRepository extends GetConnect{

  SearchRepository(){
    allowAutoSignedCert = true;
    timeout = const Duration(seconds: 30);
  }

  final Dio dio = Dio();

  Future<dynamic> LoadSearch(query) async{
    print(Search_Url.replaceFirst("query", query));
    var response = await dio.get(Search_Url.replaceFirst("query", query));
    final data = response.data;
    print(data);
    return data;
  }
}