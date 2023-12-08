import 'package:gallery360/pages/tech/repository/tech_repository.dart';
import 'package:get/get.dart';

class techController extends GetxController {
  final techRepository _techRepository = techRepository();

  Future getNewsData(String id) async {
    Map<String, dynamic> res = await _techRepository.loadNewsData(id);
    return res;
  }
}
