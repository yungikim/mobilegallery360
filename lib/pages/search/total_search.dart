import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:gallery360/pages/search/model/art_model.dart';
import 'package:gallery360/pages/search/model/artist_model.dart';
import 'package:gallery360/pages/search/sub_page/total_search_art.dart';
import 'package:gallery360/pages/search/sub_page/total_search_artist.dart';
import 'package:get/get.dart';

class TotalSeachPage extends StatefulWidget {
  TotalSeachPage({super.key});

  @override
  State<TotalSeachPage> createState() => _TotalSeachPageState();
}

class _TotalSeachPageState extends State<TotalSeachPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SearchResultController _searchResultController =
        Get.put(SearchResultController());

    final width = MediaQuery.of(context).size.width;

    return Obx(() {
      if (_searchResultController.searchcomplete.value) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                TotalSearchArtist(),
                const SizedBox(height: 20,),
                TotalSearchArt(),
              ]),
            )

            // SliverToBoxAdapter(
            //   child: ListView.builder(
            //     //    shrinkWrap: true,
            //       padding: const EdgeInsets.all(0.0),
            //       itemCount: _searchResultController.SearchArtistResult.length,
            //       itemBuilder: (context, index) {
            //         ArtistModel item =
            //         _searchResultController.SearchArtistResult[index];
            //         String purl =
            //             "${base_url}/artimage/${item.source.email}/photo_list/${item.source.email}_gray.jpg";
            //         return Container(
            //           padding: EdgeInsets.all(0.0),
            //           margin: EdgeInsets.all(5),
            //           decoration: BoxDecoration(
            //             border: Border.all(color: Colors.grey.withOpacity(0.2)),
            //           ),
            //           child: Row(
            //             children: [
            //               Container(
            //                 decoration: BoxDecoration(
            //                     image: DecorationImage(
            //                         image: NetworkImage(purl),
            //                         fit: BoxFit.cover)),
            //                 width: 80,
            //                 height: 80,
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     SizedBox(
            //                       width: width - 110,
            //                       child: Text(
            //                         "${item.source.nickname} | ${item.source.nameEng}",
            //                         overflow: TextOverflow.ellipsis,
            //                         style: const TextStyle(
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 14,
            //                         ),
            //                       ),
            //                     ),
            //                     const SizedBox(
            //                       height: 8,
            //                     ),
            //                     const Text("작가정보 더보기 >", style: TextStyle(fontSize: 13),),
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //
            //         );
            //       }),
            // )
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
