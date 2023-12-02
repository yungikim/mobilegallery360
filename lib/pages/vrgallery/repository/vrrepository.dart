import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gallery360/pages/vrgallery/controller/vrcontroller.dart';
import 'package:get/get.dart';

import '../../../const/const.dart';
import '../../MainPart/screen/widgets/models/vr_model.dart';

class VrRepository extends GetConnect {

  VrRepository() {
    allowAutoSignedCert = true;
    timeout = const Duration(seconds: 30);
  }

  final VrController _vrController = Get.put(VrController());
  final Dio dio = Dio();

  Future Load_Main_VR() async {
    var response = await dio.get(MainPage_VR_URL);
    List<dynamic> rbody = response.data;
    List<VRModel> vrList =
        rbody.map<VRModel>((json) => VRModel.fromJson(json)).toList();
    return vrList;
  }

  Future Load_Main_VR_List(int page, String sort, int limit) async {
    int px = page - 1;
    if (page > 1) {
      px = (page - 1) * limit;
    }
    String url =
        "${base_url}/load_VRRoom_public.mon?start=$px&perpage=$limit&ty=all&sort=$sort";
    var response = await dio.get(url);
    List<dynamic> rbody = response.data;
    _vrController.totalcount.value = rbody[0]['totalcount'];

    return rbody.sublist(1);
  }

  Future Load_VR_Detail_First(String key) async {
    String url = "${base_url}/load_VRRoom_public_one.mon?dockey=${key}";
    var response = await dio.get(url);
   // List<dynamic> rbody = response.data;
    return response.data;
  }

  Future<List<dynamic>> Load_VR_Detail_Second(String email) async{
    String url = "${base_url}/load_VRRoom_public.mon?start=0&perpage=10&ty=artist&artist=${email}";
    print(url);
    var response = await dio.get(url);
    List<dynamic> rbody = response.data;
    return rbody.sublist(1);
  }

  Future<List<dynamic>> Load_VR_Detail_Thrid(String email) async{
    String url = "${base_url}/load_image_for_artist.mon?start=0&perpage=20&email=${email}";
    var response = await dio.get(url);
    List<dynamic> rbody = response.data;
    return rbody.sublist(1);
  }

  Future Load_VR_Read(String key) async{
    String url = "${base_url}/vrgallery_read_count_add.mon?key=${key}";
    var response = await dio.get(url);
    return response;
  }

}
