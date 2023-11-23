import 'package:flutter/material.dart';
import 'package:gallery360/pages/search/artist_search.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:gallery360/pages/search/news_search.dart';
import 'package:gallery360/pages/search/total_search.dart';
import 'package:gallery360/pages/search/vrgallery_search.dart';
import 'package:get/get.dart';
import 'art_search.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});
  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen>  with TickerProviderStateMixin{
  //final TextEditingController _searchTextController = TextEditingController();
  final SearchResultController _searchController = Get.put(SearchResultController());
  late TabController _tabController;

  void TotalSearchFnc(String query){
    _searchController.getSearchResult(query);
    _tabController.animateTo(0);
  }

  @override
  void initState() {
    // TODO: implement initState
    _searchController.searchquery = TextEditingController();
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    //_searchTextController.dispose();
    _searchController.searchquery.dispose();
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white,),
            ),
            title: const Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Image(
                image: AssetImage("assets/images/logo/logo.png"),
                width: 130,
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: TextField(
                    autofocus: true,
                    onSubmitted: (value){
                      TotalSearchFnc(value);
                    },
                    controller: _searchController.searchquery,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      // enabledBorder: const UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.grey),
                      // ),
                      // focusedBorder: const UnderlineInputBord
                      //   borderSide: BorderSide(color: Colors.grey),
                      // ),
                        prefixIcon: const Icon(
                          Icons.search, color: Colors.black,),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear, color: Colors.black,),
                          onPressed: () {
                            //Get.back();
                            _searchController.searchquery.text = "";
                          },
                        ),
                        hintText: '작품, 작가, VR갤러리, 소식 통합검색',
                        hintStyle: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.6)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: BorderSide.none,
                        )
                    ),
                  ),
                ),
              ),

              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.grey,

                tabs: const [
                  Tab(
                    text: "통합검색",
                  ),
                  Tab(
                    text: "작가",
                  ),
                  Tab(
                    text: "작품",
                  ),
                  Tab(
                    text: "VR갤러리",
                  ),
                  Tab(
                    text: "소식",
                  ),
                ],
              ),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    TotalSeachPage(),
                    ArtistSearchPage(),
                    ArtSearchPage(),
                    VrGallerySearchPage(),
                    NewSearchPage(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


