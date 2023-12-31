import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/pages/artist/controller/artist_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../icons/custom_icons_icons.dart';
import '../../../util/Util.dart';
import '../../art/art_detail.dart';
import '../model/detail_art.dart';

class ArtistArtWidget extends StatefulWidget {
  const ArtistArtWidget({super.key});

  @override
  State<ArtistArtWidget> createState() => _ArtistArtWidgetState();
}

class _ArtistArtWidgetState extends State<ArtistArtWidget> {
  final ArtistController _artistController = Get.put(ArtistController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double default5 = ResponsiveBreakpoints.of(context).isDesktop ? 20 : 13;
    final double default6 = ResponsiveBreakpoints.of(context).isDesktop ? 22 : 18;

    return Obx(() {
      if (_artistController.dataLoadingComplete_art.value) {
        if (_artistController.detailarts.isEmpty){
          return const Center(
            child: Text("전시중인 작품이 없습니다.", style: TextStyle(fontSize: 18),),
          );
        }
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MasonryGridView.builder(
              shrinkWrap: true,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _artistController.detailarts.length,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveBreakpoints.of(context).isMobile ? 2 : 3,
              ),
              itemBuilder: (context, index) {
                DetailArt item = _artistController.detailarts[index];
                String url = Util.makeMainArtListURL(item.email, item.dockey);
                String art_title = Util.chageText(item.art_title);
                String art_artist = item.artArtist;
                String width = item.art_width;
                String height = item.art_height;
                int hosu = item.art_hosu ?? 0;
                String art_dis = "${height}x$width($hosu호)";
                String opt = item.opt ?? '';
                String price = opt == "none"
                    ? "가격문의"
                    : "￦${Util.addComma(item.art_price / 10000)}만원";
                return Container(
                  // margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(() => ArtDetailPage(dockey: item.dockey), transition: Transition.rightToLeft);
                        },
                        child: CachedNetworkImage(
                          imageUrl: url,
                          // placeholder: (context, url) =>
                          //     const CircularProgressIndicator(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              art_title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: default5),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              art_artist,
                              style: TextStyle(fontSize: default5),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              art_dis,
                              style: TextStyle(
                                  fontSize: default5,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  price,
                                  style: TextStyle(
                                      fontSize: default5, fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CustomIcons.icon_artwork_original,
                                      color: Colors.grey,
                                      size: default6,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      CustomIcons.icon_artwork_vr,
                                      color: Colors.grey,
                                      size: default6,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
