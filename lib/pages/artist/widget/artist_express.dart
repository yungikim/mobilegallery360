import 'package:flutter/material.dart';
import 'package:gallery360/pages/artist/controller/artist_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gallery360/pages/artist/model/artist_detail.dart';

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
              Util.chageText(
                      _artistController.artistInfo.value.content.toString()) ??
                  '',
              style: const TextStyle(
                fontSize: dfontsize,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _artistController.artistInfo.value.content2 != "",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    Util.chageText(_artistController.artistInfo.value.content2
                            .toString()) ??
                        '',
                    style:
                        const TextStyle(letterSpacing: 1, fontSize: dfontsize),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _artistController.artistInfo.value.group != null &&
                  _artistController.artistInfo.value.group!.length > 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "소속 및 단체",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    Util.chageText(draw0()),
                    style: const TextStyle(fontSize: dfontsize),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _artistController.artistInfo.value.education != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "학력 정보",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    Util.chageText(draw1()),
                    style: const TextStyle(fontSize: dfontsize),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Visibility(
              visible:
                  _artistController.artistInfo.value.cert?[0].certname != "" &&
                      _artistController.artistInfo.value.cert != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "작품 소장처",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    Util.chageText(draw4()),
                    style: const TextStyle(fontSize: dfontsize),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _artistController.artistInfo.value.career != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "수상 경력",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  changeTextCareer(context),
                  // Text(
                  //   Util.chageText(draw2()),
                  //   style: const TextStyle(fontSize: dfontsize),
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _artistController.artistInfo.value.display != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "전시 및 프로젝트 경력",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  changeTextDisplay(context),
                  // Text(
                  //   Util.chageText(draw3()),
                  //   style: const TextStyle(fontSize: dfontsize),
                  // ),
                ],
              ),
            )
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
        String title = group.title.trim() ?? '';
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

  Widget changeTextCareer(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    if (_artistController.artistInfo.value.career != null) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _artistController.artistInfo.value.career!.length,
        itemBuilder: (context, index){
          Career item = _artistController.artistInfo.value.career![index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width:80,child: Text(Util.chageText(item.term))),
              const SizedBox(width: 10,),
              SizedBox(width: width - 140,
                child: Text(Util.chageText(item.title.trim())),
              ),
            ],
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }

  Widget changeTextDisplay(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (_artistController.artistInfo.value.display != null) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _artistController.artistInfo.value.display!.length,
        itemBuilder: (context, index){
          Display item = _artistController.artistInfo.value.display![index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width : 80, child: Text(item.term)),
              const SizedBox(width: 10,),
              SizedBox(width: width - 140,
                child: Text(Util.chageText(item.title.trim())),
              ),
            ],
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }

  String draw4() {
    String res = "";
    if (_artistController.artistInfo.value.cert != null) {
      for (var i = 0;
          i < _artistController.artistInfo.value.cert!.length;
          i++) {
        var cert = _artistController.artistInfo.value.cert![i];
        String title = cert.certname.trim() ?? '';
        res = "$res$title \n";
      }
    }
    return res;
  }
}
