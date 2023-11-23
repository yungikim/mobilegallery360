import 'package:flutter/material.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:gallery360/pages/search/model/artist_category_model.dart';
import 'package:gallery360/pages/search/model/artist_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ArtistSearchPage extends StatefulWidget {
  const ArtistSearchPage({super.key});

  @override
  State<ArtistSearchPage> createState() => _ArtistSearchPageState();
}

class _ArtistSearchPageState extends State<ArtistSearchPage> {
  final SearchResultController _searchResultController =
      Get.put(SearchResultController());

  late final ScrollController scrollController;

  @override
  void initState() {
    //_searchResultController.getSearchCategory("여름날", "user", "0");
    // TODO: implement initState
    scrollController = ScrollController();
    scrollController.addListener(onScroll);
    super.initState();
  }

  void onScroll(){
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    if (maxScroll == currentScroll && _searchResultController.hasMore.value){
      _searchResultController.getSearchCategory("김", "user", "0");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _searchResultController.getSearchCategory("김", "user", "0"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<ArtistCategoryModel> items = snapshot.data;
          return CustomScrollView(

            slivers: [
              SliverList.builder(
                itemCount: _searchResultController.hasMore.value ? items.length + 1 : items.length,
                itemBuilder: (context, index){
                  ArtistCategoryModel item = items[index];
                  if (index < items.length){
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 400,
                      color: Colors.red,
                    );
                  }else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
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

    // return Obx(() {
    //   if (_searchResultController.searchcomplete.value) {
    //     return FutureBuilder(
    //       child: CustomScrollView(
    //         slivers: [
    //           SliverList.builder(
    //             itemCount: _searchResultController.SearchArtistCategory.length,
    //             itemBuilder: (context, index){
    //               ArtistCategoryModel item = _searchResultController.SearchArtistCategory[index];
    //               return Text(item.source.nickname);
    //             },
    //           ),
    //         ],
    //       ),
    //     );
    //   } else {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }
    // });
  }
}
