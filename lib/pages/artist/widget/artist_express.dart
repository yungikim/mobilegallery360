import 'package:flutter/material.dart';
import 'package:gallery360/pages/artist/controller/artist_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../util/Util.dart';

class ArtistExpressWidget extends StatelessWidget {
  ArtistExpressWidget({super.key});

  final ArtistController _artistController = Get.put(ArtistController());

  @override
  Widget build(BuildContext context) {

    const double dfontsize = 13.0;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _artistController.artistInfo.value.nickname,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _artistController.artistInfo.value.nameEng ?? '',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              _artistController.artistInfo.value.content ?? '',
              style: const TextStyle(
                fontSize: dfontsize,
              ),
            ),
            const SizedBox(
              height: 30,
            ),




            const Text(
              "작가노트",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              _artistController.artistInfo.value.content2 ?? '',
              style: const TextStyle(letterSpacing: 1, fontSize: dfontsize),
            ),
            const SizedBox(
              height: 40,
            ),

            Visibility(
              visible: _artistController.artistInfo.value.group != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("소속 및 단체",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  const SizedBox(height: 20,),
                  Text(Util.chageText(draw0()), style: TextStyle(fontSize: dfontsize),),
                ],
              ),
            ),


            const Text(
              "학력 정보",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              draw1(),
              style: const TextStyle(fontSize: dfontsize),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "수상 경력",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              draw2(),
              style: const TextStyle(fontSize: dfontsize),
            ),
          ],
        ),
      ),
    );
  }

  String draw0() {
    String res = "";
    if (_artistController.artistInfo.value.group != null) {
      for (var i = 0;
      i < _artistController.artistInfo.value.group!.length;
      i++) {
        var group = _artistController.artistInfo.value.group![i];
        String dept = group.dept ?? '';
        String jobtitle = group.jobtitle ?? '';
        String title = group.title ?? '';
        res = "$res$title $dept $jobtitle\n";
      }
    }
    return res;
  }

  String draw1() {
    String res = "";
    if (_artistController.artistInfo.value.education != null) {
      for (var i = 0;
          i < _artistController.artistInfo.value.education!.length;
          i++) {
        var edu = _artistController.artistInfo.value.education![i];
        String school = edu.schoolname ?? '';
        String end = edu.end ?? '';
        String major = edu.major ?? '';
        String level = edu.level ?? '';
        res = "$res$end $school $level졸업\n";
      }
    }
    return res;
  }

  String draw2() {
    String res = "";
    if (_artistController.artistInfo.value.career != null) {
      for (var i = 0;
          i < _artistController.artistInfo.value.career!.length;
          i++) {
        var career = _artistController.artistInfo.value.career![i];
        String term = career.term ?? '';
        String title = career.title ?? '';
        res = "$res$term         $title \n";
      }
    }
    print(res);
    return res;
  }
}
