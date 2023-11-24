import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../const/const.dart';
import '../../icons/custom_icons.dart';
import '../../util/Util.dart';

class VrGallerySearchPage extends StatefulWidget {
  const VrGallerySearchPage({super.key});

  @override
  State<VrGallerySearchPage> createState() => _VrGallerySearchPageState();
}

class _VrGallerySearchPageState extends State<VrGallerySearchPage> {
  final SearchResultController _searchResultController =
      Get.put(SearchResultController());
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(onScroll);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(onScroll);
    // TODO: implement dispose
    super.dispose();
  }

  void onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    double delta = 10.0;
    if (maxScroll == currentScroll &&
        _searchResultController.hasMore_vr.value) {
      _searchResultController.getSearchCategory("vr");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (_searchResultController.isLoadingComplete_vr.value) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 20),
                  child: _searchResultController.SearchVRCategory.isNotEmpty
                      ? Text(
                          "검색결과 ${_searchResultController.totalSearchCount_vr.value}개",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      : Text(""),
                ),
              ),
              SliverToBoxAdapter(
                child: MasonryGridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: _searchResultController.SearchVRCategory.length,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: ResponsiveBreakpoints.of(context).isMobile ? 1 : 2,
                  ),
                  itemBuilder: (context, index) {
                    var item =
                        _searchResultController.SearchVrGallyResult[index];
                    Map<String, dynamic> etc = jsonDecode(item.source.etc);
                    String id = item.source.id.split("-=spl=-")[0];
                    var url =
                        "${base_url}/vr/vr/vrgallery/${item.source.email}/${id}/pano_f.jpg";
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.4)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 270,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(url),
                                  fit: BoxFit.cover,
                                ),
                              ), //child:
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
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
