import 'package:get/get.dart';
import '../repository/about_repository.dart';

class AboutController extends GetxController{

  final AboutRepository _aboutRepository = AboutRepository();

  Future getAboutUs() async{
    try{
      Map<String, dynamic>  res = await _aboutRepository.loadAboutUs();
      print(res);
      return res;
    }catch(e){
      e.printError();
    }

  }
}