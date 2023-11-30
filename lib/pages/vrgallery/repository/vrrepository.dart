
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../const/const.dart';
import '../../MainPart/screen/widgets/models/vr_model.dart';

class VrRepository extends GetConnect{
  VrRepository(){
    allowAutoSignedCert = true;
    timeout = const Duration(seconds: 30);
  }

  final Dio dio = Dio();

  Future Load_Main_VR() async{
    var response = await dio.get(MainPage_VR_URL);
    List<dynamic> rbody = response.data;
    List<VRModel> vrList = rbody.map<VRModel>((json) => VRModel.fromJson(json)).toList();
    return vrList;
  }
}