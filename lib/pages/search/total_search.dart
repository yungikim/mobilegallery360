import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:gallery360/pages/search/model/art_model.dart';
import 'package:gallery360/pages/search/model/artist_model.dart';
import 'package:get/get.dart';

class TotalSeachPage extends StatelessWidget {
  TotalSeachPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchResultController _searchResultController =
        Get.put(SearchResultController());

    return Obx(() {
      if (_searchResultController.searchcomplete.value) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "작가",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "(${_searchResultController.SearchArtistTotalCount.value})",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "작가 더 보기 >",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(0.0),
                  itemCount: _searchResultController.SearchArtistResult.length,
                  itemBuilder: (context, index) {
                    ArtistModel item =
                        _searchResultController.SearchArtistResult[index];
                    String purl =
                        "${base_url}/artimage/${item.source.email}/photo_list/${item.source.email}_gray.jpg";
                    return Container(
                      padding: EdgeInsets.all(0.0),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(purl),
                                    fit: BoxFit.cover)),
                            width: 80,
                            height: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${item.source.nickname} | ${item.source.nameEng}",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("작가정보 더보기 >", style: TextStyle(fontSize: 13),),
                              ],
                            ),
                          )
                        ],
                      ),
                      // child: ListTile(
                      //   title: Text("${item.source.nickname} | ${item.source.nameEng}"),
                      //   subtitle: Text("작가정보 더보기 >"),
                      //   leading: Container(
                      //     width: 70,
                      //     height: 70,
                      //     decoration: BoxDecoration(
                      //      // color: Colors.red,
                      //       borderRadius: BorderRadius.circular(5),
                      //       image: DecorationImage(
                      //         image: NetworkImage(purl),
                      //         fit: BoxFit.cover
                      //       )
                      //     ),
                      //   ),
                      // ),
                    );
                  }),
            ),
          ],
        );
      } else {
        return _searchResultController.isSearching.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox();
      }
    });
  }
}
