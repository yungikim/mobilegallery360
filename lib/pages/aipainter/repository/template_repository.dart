import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:get/get.dart';

class templateRepository extends GetConnect{
  templateRepository(){
    allowAutoSignedCert = true;
    timeout = const Duration(seconds: 30);
  }

  final Dio dio = Dio();

  Future<dynamic> loadTemplate() async{
    try{
      String url = "$base_url/template_images.mon";
      print(url);
      final response = await dio.get(url);
      print(response);
      List<dynamic> data = response.data;
      return data;
    }catch(e){
      e.printError();
    }

  }
}