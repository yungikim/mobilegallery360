import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../util/Util.dart';
import '../controller/art_controller.dart';
import '../model/art_list_model.dart';

final ArtInfoController _artInfoController = Get.put(ArtInfoController());

void ShowBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      builder: (context) {
        return Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.83,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 10),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    //color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        //금액 기간을 설정하는 경우는 시트가 닫히는 이벤트에서 값을 설정한다.
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                      ),
                      child: const Text(
                        "Apply",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    child: const Text(
                      "테마",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        squreBox("풍경"),
                        squreBox("인물"),
                        squreBox("정물"),
                        squreBox("동물"),
                        squreBox("추상"),
                        squreBox("팝아트"),
                        squreBox("오브제"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    child: const Text(
                      "색상",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        squreCircle(Colors.red, "red_"),
                        squreCircle(Colors.deepOrange, "orange_"),
                        squreCircle(Colors.yellow, "yellow_"),
                        squreCircle(Colors.greenAccent, "light-green_"),
                        squreCircle(Colors.green, "green_"),
                        squreCircle(Colors.blueAccent, "light-blue_"),
                        squreCircle(Colors.blue, "blue_"),
                        squreCircle(Colors.purple, "purple_"),
                        squreCircle(Colors.pink, "pink_"),
                        squreCircle(Colors.purpleAccent, "light-purple_"),
                        squreCircle(Colors.brown, "brown_"),
                        squreCircle(Colors.grey, "grey_"),
                        squreCircle(Colors.white, "white_"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    child: const Text(
                      "형태",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        squreBox_width_icon(shapeData("1")),
                        squreBox_width_icon(shapeData("2")),
                        squreBox_width_icon(shapeData("3")),
                        squreBox_width_icon(shapeData("4")),
                        squreBox_width_icon(shapeData("5")),
                        squreBox_width_icon(shapeData("6")),
                        squreBox_width_icon(shapeData("7")),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    child: const Text(
                      "사이즈",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        squreBox_width_icon2(sizeData("1~10")),
                        squreBox_width_icon2(sizeData("11~30")),
                        squreBox_width_icon2(sizeData("31~60")),
                        squreBox_width_icon2(sizeData("61~80")),
                        squreBox_width_icon2(sizeData("100~500")),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    child: Row(
                      children: [
                        const Text(
                          "가격",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => Text(
                            "(${Util.addComma(_artInfoController.query_price.value.start)}만원 ~ ${Util.addComma(_artInfoController.query_price.value.end)}만원)",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        showValueIndicator: ShowValueIndicator.always,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                      ),
                      child: Obx(
                        () => SizedBox(
                          width: MediaQuery.of(context).size.width * 0.98,
                          child: RangeSlider(
                            min: 0,
                            max: 10000.0,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            divisions: 100,
                            labels: RangeLabels(
                              _artInfoController.query_price.value.start
                                  .round()
                                  .toString(),
                              _artInfoController.query_price.value.end
                                  .round()
                                  .toString(),
                            ),
                            values: _artInfoController.query_price.value,
                            onChanged: (RangeValues value) {
                              int sVal = value.start.round();
                              int sFal = value.end.round();
                              _artInfoController.query_price.value = value;
                              //facetPriceList.toggle(facet.value);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      }).whenComplete((){
        //sheet가 닫히는 이벤트를 잡아서 처리한다.
        if (_artInfoController.query_price.value.start != 0 &&
            _artInfoController.query_price.value.end != 0) {
          _artInfoController.query_dis.removeWhere((element) => element.toString().contains("만원"));
          _artInfoController.query_dis.add("${Util.addComma2(
              _artInfoController.query_price.value.start
                  .toInt())}만원 ~${Util.addComma2(_artInfoController.query_price.value.end
              .toInt())}만원");
        }
        //설정된 값으로 다시 데이터를 쿼리해서 결과를 표시한다.
        _artInfoController.isSearch.value = true;
        _artInfoController.getArtList_option("T");

        _artInfoController.persistenHeight.value = 140;
  });
}


Widget squreBox(String text){
  return GestureDetector(
    onTap: () {
      if (_artInfoController.query_thema.contains(text)){
        _artInfoController.query_thema.removeWhere((element) => element == text);
        _artInfoController.query_dis.removeWhere((element) => element == text);
      }else{
        _artInfoController.query_thema.add(text);
        _artInfoController.query_dis.add(text);
      }
    },
    child: Obx(
      ()=> Container(
        height: 50,
        width: 80,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: _artInfoController.query_thema.contains(text) ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          text,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget squreBox_width_icon(List<String> item) {
  String bun = item[0];
  String txt = item[1];
  String img = item[2];

  return GestureDetector(
    onTap: () {
      if (_artInfoController.query_shape.contains(bun)){
        _artInfoController.query_shape.removeWhere((element) => element ==bun);
        _artInfoController.query_dis.removeWhere((element) => element == txt);
      }else{
        _artInfoController.query_shape.add(bun);
        _artInfoController.query_dis.add(txt);
      }

    },
    child: Obx(
      ()=> Container(
        height: 50,
        width: 140,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: _artInfoController.query_shape.contains(bun) ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/art/$img",
              width: 40,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              txt,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget squreBox_width_icon2(List<String> item) {
  String bun = item[0];
  String txt = item[1];
  String img = item[2];

  return GestureDetector(
    onTap: () {
      if (_artInfoController.query_size.contains(bun)){
        _artInfoController.query_size.removeWhere((element) => element == bun);
        _artInfoController.query_dis.removeWhere((element) => element == txt);
      }else{
        _artInfoController.query_size.add(bun);
        _artInfoController.query_dis.add(txt);
      }

    },
    child: Obx(
      ()=> Container(
        height: 50,
        width: 130,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: _artInfoController.query_size.contains(bun) ? Colors.blue :  Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/art/$img",
              width: 40,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              txt,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget squreCircle(Color color, String text) {
  return GestureDetector(
    onTap: () {
      if (_artInfoController.query_color.contains(text)){
        _artInfoController.query_color.removeWhere((element) => element == text);
        _artInfoController.query_dis.removeWhere((element) => element == text);
      }else{
        _artInfoController.query_color.add(text);
        _artInfoController.query_dis.add(text);
      }

    },
    child: Obx(
      ()=> Container(
        height: 80,
        width: 80,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: _artInfoController.query_color.contains(text) ? Border.all(color: Colors.blue,width: 3) :  Border.all(color: Colors.grey),
        ),
      ),
    ),
  );
}

Color checkColor(String txt) {
  if (txt == "red") {
    return Colors.red;
  } else if (txt == "orange") {
    return Colors.orange;
  } else if (txt == "yellow") {
    return Colors.yellow;
  } else if (txt == "light-green") {
    return Colors.greenAccent;
  } else if (txt == "green") {
    return Colors.green;
  } else if (txt == "light-blue") {
    return Colors.blueAccent;
  } else if (txt == "blue") {
    return Colors.blue;
  } else if (txt == "purple") {
    return Colors.purple;
  } else if (txt == "pink") {
    return Colors.pink;
  } else if (txt == "light-purple") {
    return Colors.purpleAccent;
  } else if (txt == "brown") {
    return Colors.brown;
  } else if (txt == "grey") {
    return Colors.grey;
  } else if (txt == "white") {
    return Colors.white;
  }
  return Colors.white;
}

String checkBun(String str){
  String res = "";
  if (str == "정방형"){
    return "1";
  }else if (str == "가로형"){
    return "2";
  }else if (str == "세로형"){
    return "3";
  }else if (str == "원형"){
    return "4";
  }else if (str == "셋트"){
    return "5";
  }else if (str == "입체/설치"){
    return "6";
  }else if (str == "미디어"){
    return "7";
  }
  return res;
}

List<String> shapeData(String bun) {
  List<String> item = [];
  if (bun == "1") {
    item.add("1");
    item.add("정방형");
    item.add("icon-aw-filter-square-normal.png");
  } else if (bun == "2") {
    item.add("2");
    item.add("가로형");
    item.add("icon-aw-filter-horizontal-normal.png");
  } else if (bun == "3") {
    item.add("3");
    item.add("세로형");
    item.add("icon-aw-filter-vertical-normal.png");
  } else if (bun == "4") {
    item.add("4");
    item.add("원형");
    item.add("icon-aw-filter-circle-normal.png");
  } else if (bun == "5") {
    item.add("5");
    item.add("셋트");
    item.add("icon-aw-filter-set-normal.png");
  } else if (bun == "6") {
    item.add("6");
    item.add("입체/설치");
    item.add("icon-aw-filter-install-normal.png");
  } else if (bun == "7") {
    item.add("7");
    item.add("미디어");
    item.add("icon-aw-filter-media-normal.png");
  }
  return item;
}

String checkSizeBun(String str){
  String res = "";
  if (str == "100+"){
    return "100~500";
  }else {
    return str.replaceAll("호", "");
  }
  return res;
}

List<String> sizeData(String bun) {
  List<String> item = [];
  if (bun == "1~10") {
    item.add("1~10");
    item.add("1~10호");
    item.add("icon-aw-filter-1-10-normal.png");
  } else if (bun == "11~30") {
    item.add("11~30");
    item.add("11~30호");
    item.add("icon-aw-filter-30-normal.png");
  } else if (bun == "31~60") {
    item.add("31~60");
    item.add("31~60호");
    item.add("icon-aw-filter-60-normal.png");
  } else if (bun == "61~80") {
    item.add("61~80");
    item.add("61~80호");
    item.add("icon-aw-filter-80-normal.png");
  } else if (bun == "100~500") {
    item.add("100~500");
    item.add("100+");
    item.add("icon-aw-filter-100-normal.png");
  }
  return item;
}
