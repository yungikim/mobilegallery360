import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/icons/custom_icons_icons.dart';
import 'package:gallery360/pages/artist/controller/artist_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../const/const.dart';
import '../../../util/Util.dart';
import '../../vrgallery/vr_detail.dart';

class ArtistVRWidget extends StatefulWidget {
  const ArtistVRWidget({super.key});

  @override
  State<ArtistVRWidget> createState() => _ArtistVRWidgetState();
}

class _ArtistVRWidgetState extends State<ArtistVRWidget> {
  final ArtistController _artistController = Get.put(ArtistController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_artistController.dataLoadingComplete_vr.value) {
        if (_artistController.detailvrs.isEmpty){
          return const Center(
            child: Text("전시중인 VR갤러리가 없습니다.", style: TextStyle(fontSize: 18),),
          );
        }
        return MasonryGridView.builder(
          itemCount: _artistController.detailvrs.length,
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveBreakpoints.of(context).isMobile ? 1 : 2,
          ),
          itemBuilder: (context, index) {
            var item = _artistController.detailvrs[index];
            var url = Util.VrUrl(item.dockey.toString());
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(() => VrDetailPage(dockey: item.dockey), transition: Transition.rightToLeft);
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
                    Util.chageText(item.title),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.nickname,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(CustomIcons.icon_vr_view_count_b),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(Util.addComma2(item.read)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(CustomIcons.icon_vr_collect_count_b),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("${item.like}"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
