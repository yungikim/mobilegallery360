import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:get/get.dart';
import '../../../../util/Util.dart';
import 'models/data_model.dart';

class MainRecommandImage extends StatefulWidget {
  const MainRecommandImage({super.key});

  @override
  State<MainRecommandImage> createState() => _MainRecommandImageState();
}



class _MainRecommandImageState extends State<MainRecommandImage> {
  final DataController _dataController = Get.put(DataController());

  void checkMainImage2(){

    //_dataController.firstPageArtData.value = <DataModel>[];
    _dataController.getFirstPageArtDataCallDio().then((value){
      //_dataController.firstPageArtData.value = value;

      DataModel dm = value[0];
      _dataController.mainPageRecommandImageURL.value = Util.makeMainArtListURL(dm.email, dm.artImgFilename);
    });
  }


  @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    checkMainImage2();

      return Obx(
          () => Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(38.0),
                child:  CachedNetworkImage(
                  //  imageUrl: _dataController.mainPageRecommandImageURL.value.toString(),
                        imageUrl:  'https://www.gallery360.co.kr/artimage/kimjiyoun72@naver.com/art/preview/kimjiyoun72@naver.com_b8a1d8f684a9dcd8d28a995eb37adb39.7021844.jpg?open&ver=1700114846568?open&ver=1602322826950',
                  ),


              ),
              const SizedBox(
                height: 0.0,
              ),
              const Text("붉은 자작나무 숲", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),),
              const Text("Zinnakim"),
              const SizedBox(
                height: 30.0,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  side: const BorderSide(color: Colors.grey),
                ),
                onPressed: () {},
                child: const Text("작품보기", style: TextStyle(color: Colors.black, fontSize: 15.0,),),
              )
            ],
          ),
        ),
      );
    }

}
