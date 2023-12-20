import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/artist/controller/artist_controller.dart';
import 'package:gallery360/pages/artist/widget/artist_art.dart';
import 'package:gallery360/pages/artist/widget/artist_express.dart';
import 'package:gallery360/pages/artist/widget/artist_vr.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../util/Util.dart';

class ArtistDetailPage extends StatefulWidget {
  const ArtistDetailPage({super.key, required this.email});

  final String email;

  @override
  State<ArtistDetailPage> createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> with TickerProviderStateMixin{
  final ArtistController _artistController = Get.put(ArtistController());
  late TabController _tabController;

  @override
  void initState() {
    callDetail();
    _artistController.current_email.value = widget.email;
    _artistController.dataLoadingComplete_art.value = false;
    _artistController.dataLoadingComplete_vr.value = false;

    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_chageTab);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController.removeListener(_chageTab);
    // TODO: implement dispose
    super.dispose();
  }

  void callDetail() async{
    _artistController.dataLoadingComplete_detail.value = false;
    _artistController.artistDetail(widget.email);
  }

  void _chageTab(){
    switch (_tabController.index) {
      case 1:
        if (!_artistController.dataLoadingComplete_art.value){
          _artistController.page_art.value = 1;
          _artistController.hasMore_art.value = true;
          _artistController.detailarts.value = [];
          _artistController.dataLoadingComplete_art.value = false;
          _artistController.getDetailArt();
        }
      case 2:
        if (!_artistController.dataLoadingComplete_vr.value){
          _artistController.page_vr.value = 1;
          _artistController.hasMore_vr.value = true;
          _artistController.detailvrs.value = [];
          _artistController.dataLoadingComplete_vr.value = false;
          _artistController.getDetailVR();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: const Text("작가 상세보기", style: TextStyle(color: Colors.white),),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(onPressed: (){
      //       Get.back();
      //     }, icon: const Icon(Icons.close, color: Colors.white, size: 25,)),
      //   ],
      // ),
      body: Obx(() {
        if (_artistController.dataLoadingComplete_detail.value){
          return DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  floating: false,
                  pinned: true,
                  expandedHeight: ResponsiveBreakpoints.of(context).isMobile ? 250 : 350,
                  actions: [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: const Icon(Icons.close, color: Colors.white, size: 25,)),
                  ],
                  title: const Text("작가 상세보기", style: TextStyle(color: Colors.white, fontSize:18),),
                  centerTitle: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        // Container(
                        //   decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //         image: NetworkImage("${base_url}/artimage/${widget.email}/photo_profile/${widget.email}_gray.jpg"),
                        //         fit: BoxFit.cover,
                        //         colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                        //       )
                        //   ),
                        // ),
                       cacheImage(
                         url: "$base_url/artimage/${widget.email}/photo_profile/${widget.email}_gray.jpg",
                         colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                       ),
                      ],
                    ),
                  ),
                  bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.red,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    labelStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: const TextStyle(fontSize: 15.0),
                    tabs: const [
                      Tab(
                        text: "작가 소개",
                      ),
                      Tab(
                        text: "작품",
                      ),
                      Tab(
                        text: "VR 전시",
                      )
                    ],
                  ),
                ),

              ],
              body: TabBarView(
                controller: _tabController,
                children: [
                  ArtistExpressWidget(),
                  const ArtistArtWidget(),
                  const ArtistVRWidget(),
                ],
              ),
            ),
          );
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
