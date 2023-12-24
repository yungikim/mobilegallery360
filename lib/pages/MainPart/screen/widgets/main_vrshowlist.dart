import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:gallery360/util/Util.dart';
import 'package:get/get.dart';
import 'models/vr_showmodel.dart';

class VrShowList extends StatefulWidget {
  const VrShowList({super.key});

  @override
  State<VrShowList> createState() => _VrShowListState();
}

class _VrShowListState extends State<VrShowList> {
  final DataController _dataController = Get.put(DataController());
  final CarouselController _carouselController = CarouselController();
  var _current = 0;

  @override
  void initState() {
    // _dataController.getVrShowList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dataController.getVrShowList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<VrShow> items = snapshot.data;
          return Column(
            children: [
              SizedBox(
                height: 150,
              //  color: Colors.red,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customOutlineButton(tr('main_33'), 0),
                      const SizedBox(width: 10.0,),
                      customOutlineButton(tr('main_34'), 1),
                      const SizedBox(width: 10.0,),
                      customOutlineButton(tr('main_35'), 2),
                      const SizedBox(width: 10.0,),
                      customOutlineButton(tr('main_36'), 3),
                    ],
                  ),
                ),
              ),
              CarouselSlider(
                carouselController: _carouselController,
                  items: items
                          .map((item) => GestureDetector(
                            onTap: (){
                              Util.UrlOpenWebview(item.shortUrl, item.lendingName);
                              //Util.UrlOpen(item.shortUrl);
                            },
                            child: cacheImage(
                                url: "$base_url/artimage/lending/${item.image}",
                                childtext: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      alignment: Alignment.centerLeft,
                                      width: double.infinity,
                                      height: 70.0,
                                      color: Colors.black.withOpacity(0.5),
                                      child: Text(
                                        "${item.lendingName} / ${item.organizerName}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                            color: Colors.white.withOpacity(0.7),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    )
                                  ],
                                ),
                                boxshadow:  const BoxShadow(
                                  offset: Offset(5,13),
                                  blurRadius: 15.0,
                                  color: Colors.black,
                                ),
                            ),
                          )).toList(),

                  options: CarouselOptions(
                    onPageChanged: (index, reaseon){
                        _dataController.currentItem.value = index;
                    },
                //    autoPlay: true,
               //     viewportFraction: 1,
              //      autoPlayInterval: const Duration(seconds: 7),
                    aspectRatio: 2.0,

                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                  )),
            ],
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Initialization Failed'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget customOutlineButton(String title, int index){
    return Obx(
        ()=> OutlinedButton(
        onPressed : () async{
          await _carouselController.animateToPage(index);
          _dataController.currentItem.value = index;
        },
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal:15.0),
            side: index == _dataController.currentItem.value ? const BorderSide(color: Color(0xff9b3de4)) : const BorderSide(color: Colors.transparent),
        ),
        child: Text(
          "#$title",
          style: TextStyle(
            color: index == _dataController.currentItem.value ? const Color(0xff9b3de4) : Colors.black,
          ),
        ),
      ),
    );
  }

}
