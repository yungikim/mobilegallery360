import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:gallery360/MainPart/screen/widgets/models/vr_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class VRList extends StatefulWidget {
  const VRList({super.key});

  @override
  State<VRList> createState() => _VRListState();
}

class _VRListState extends State<VRList> {
  final DataController _dataController = Get.put(DataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void checkVR(){
    _dataController.getVrListDataCallDio().then((value) {
      _dataController.vrListData.value = value;
      for (int i = 0 ; i < _dataController.vrListData.value.length; i++){
        VRModel vr = _dataController.vrListData.value[i];
        if (vr.email != null){
          _dataController.emails.add(vr.email.toString());
          _dataController.dockeys.add(vr.dockey.toString());
          String url = "https://www.gallery360.co.kr/vr/vr/vrgallery/${vr.email}/${vr.dockey}/pano_f.jpg";
          _dataController.imageURLs.add(url);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    checkVR();
    print("VRList Draw.................");
    print(_dataController.imageURLs.length);
    //print(Obx((){return _dataController.imageURLs.length}));
    // int ll = Get.find<DataController>().imageURLs.length;
    // print(ll);

    return Obx(
      () => CarouselSlider(
        items: _dataController.imageURLs.map((e) => Container(
           height: 400.0,
          // width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
          //  borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: NetworkImage(e), fit: BoxFit.cover,
            )
          ),
        )).toList(),
        options: CarouselOptions(
          //height: 200,
          autoPlay: true,
          viewportFraction: 1,
          autoPlayInterval: const Duration(seconds: 10),
          aspectRatio: 1.5,
          //    enlargeCenterPage: true,   //가운데 만 조금 커지는 옵션
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,  //높이가 동일한 이미지로 표시하는 옵션
        ),
      ),
    );
  }
}
