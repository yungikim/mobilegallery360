import 'package:flutter/material.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../model/artist_model.dart';

class TotalSearchArtist extends StatelessWidget {
  TotalSearchArtist({super.key});

  final SearchResultController _searchResultController =
      Get.put(SearchResultController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                  const Text(
                    "작가",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "(${_searchResultController.SearchArtistTotalCount.value})",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text(
                "작가 더 보기 >",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0.0),
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
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(purl), fit: BoxFit.cover)),
                      width: 80,
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width - 110,
                            child: Text(
                              "${item.source.nickname} | ${item.source.nameEng}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "작가정보 더보기 >",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }
}
