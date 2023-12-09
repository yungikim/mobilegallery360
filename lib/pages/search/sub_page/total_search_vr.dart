import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../icons/custom_icons.dart';
import '../../../util/Util.dart';
import '../../vrgallery/vr_detail.dart';

class TotalSearchVR extends StatefulWidget {
  TotalSearchVR({required this.tab,super.key});
  TabController tab;
  @override
  State<TotalSearchVR> createState() => _TotalSearchVRState();
}

class _TotalSearchVRState extends State<TotalSearchVR> {
  late SearchResultController _searchResultController;

  @override
  void initState() {
    _searchResultController = Get.put(SearchResultController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Visibility(
      visible: _searchResultController.SearchVrGalleryTotalCount.value > 0,
      child: Column(
        children: [
          Container(
            width: width * 0.95,
            height: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "VR갤러리",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "(${_searchResultController.SearchVrGalleryTotalCount.value})",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    widget.tab.animateTo(3);
                  },
                  child: const Text(
                    "VR갤러리 더 보기 >",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _searchResultController.SearchVrGallyResult.length,
            crossAxisCount: ResponsiveBreakpoints.of(context).isMobile ? 1 : 2,
            itemBuilder: (context, index){
              var item = _searchResultController.SearchVrGallyResult[index];
              Map<String, dynamic> etc = jsonDecode(item.source.etc);
              String id = item.source.id.split("-=spl=-")[0];
              var url =
              "${base_url}/vr/vr/vrgallery/${item.source.email}/${id}/pano_f.jpg";
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        print(item.source.id);
                        Get.to(() => VrDetailPage(dockey: id), transition: Transition.rightToLeft);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 270,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ), //child:
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      Util.chageText(etc['title']),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.source.nickname,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(MyFlutterApp.icon_vr_view_count_b),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(Util.addComma2(etc['read'])),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(MyFlutterApp.icon_vr_collect_count_b),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("${etc['like']}"),
                      ],
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
