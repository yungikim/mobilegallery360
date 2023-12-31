import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../util/Util.dart';
import '../../art/art_detail.dart';
import '../model/art_model.dart';

class TotalSearchArt extends StatelessWidget {
  TotalSearchArt({required this.tab, super.key});
  TabController tab;

  final SearchResultController _searchResultController =
      Get.put(SearchResultController());

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Visibility(
      visible: _searchResultController.SearchArtTotalCount.value  > 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                      "작품",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "(${_searchResultController.SearchArtTotalCount.value})",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    tab.animateTo(2);
                  },
                  child: const Text(
                    "작품 더 보기 >",
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
            crossAxisCount: ResponsiveBreakpoints.of(context).isMobile ? 2 : 3,
            itemCount: _searchResultController.SearchArtResult.length,
            itemBuilder: (context, index) {
              ArtModel item = _searchResultController.SearchArtResult[index];
              String url =
                  Util.makeMainArtListURL(item.source.email, item.source.id);
              Map<String, dynamic> tx = jsonDecode(item.source.etc);
              String art_title = Util.chageText(tx['art_title']);
              String art_artist = tx['art_artist'];
              String width = tx['art_width'];
              String height = tx['art_height'];
              int hosu = tx['art_hosu'];
              String art_dis = "${height}x$width($hosu호)";
              String opt = item.source.opt;
              String price = opt == "none" ? "가격문의" : "￦${Util.addComma(tx['art_price'] / 10000)}만원";

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                  //   image: DecorationImage(
                  // image: NetworkImage(url),
                  // fit: BoxFit.cover,
                //)
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(() => ArtDetailPage(dockey: item.source.id), transition: Transition.rightToLeft);
                      },
                      child: CachedNetworkImage(
                        imageUrl: url,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(art_title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),),
                          const SizedBox(height: 5,),
                          Text(art_artist, style: TextStyle(fontSize: 12),),
                          const SizedBox(height: 5,),
                          Text(art_dis, style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5)),),
                          const SizedBox(height: 7,),
                          Text(price, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),

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
