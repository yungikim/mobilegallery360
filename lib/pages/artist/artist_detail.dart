import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/artist/controller/artist_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ArtistDetailPage extends StatefulWidget {
  const ArtistDetailPage({super.key, required this.email});

  final String email;

  @override
  State<ArtistDetailPage> createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {
  final ArtistController _artistController = Get.put(ArtistController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("작가 상세보기", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Get.back();
          }, icon: const Icon(Icons.close, color: Colors.white, size: 35,)),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.black,
              automaticallyImplyLeading: false,
              floating: false,
              pinned: false,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("${base_url}/artimage/${widget.email}/photo_profile/${widget.email}_gray.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                        )
                      ),
                    )
                  ],
                ),
              ),
              bottom: const TabBar(
                indicatorColor: Colors.grey,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontSize: 15.0),
                tabs: [
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
            children: [
              Container(height: 600, color: Colors.red,),
              Container(height: 100,),
              Container(height: 100,),
            ],
          ),
        ),
      ),
    );
  }
}
