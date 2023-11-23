import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../icons/custom_icons.dart';
import '../../../util/Util.dart';

class TotalSearchVR extends StatefulWidget {
  const TotalSearchVR({super.key});

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
    return Column(
      children: [
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
              const Text(
                "작품 더 보기 >",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _searchResultController.SearchVrGallyResult.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  ResponsiveBreakpoints.of(context).isMobile ? 1 : 2),
          itemBuilder: (context, index) {
            var item = _searchResultController.SearchVrGallyResult[index];
            Map<String, dynamic> etc = jsonDecode(item.source.etc);
            String id = item.source.id.split("-=spl=-")[0];
            var url = "${base_url}/vr/vr/vrgallery/${item.source.email}/${id}/pano_f.jpg";
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height : 270,
                    decoration: BoxDecoration(
                        color: Colors.red,
                      image: DecorationImage(
                        image: NetworkImage(url),fit: BoxFit.cover,
                      ),
                    ),  //child:
                  ),
                  const SizedBox(height: 10,),
                  Text(Util.chageText(etc['title']), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text(item.source.nickname, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Icon(MyFlutterApp.icon_vr_view_count_b),
                      const SizedBox(width: 5,),
                      Text("${Util.addComma2(etc['read'])}"),
                      const SizedBox(width: 10,),
                      const Icon(MyFlutterApp.icon_vr_collect_count_b),
                      const SizedBox(width: 5,),
                      Text("${etc['like']}"),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
