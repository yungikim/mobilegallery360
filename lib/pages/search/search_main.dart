import 'package:flutter/material.dart';
import 'package:gallery360/pages/search/artist_search.dart';
import 'package:gallery360/pages/search/controller/search_controller.dart';
import 'package:gallery360/pages/search/news_search.dart';
import 'package:gallery360/pages/search/total_search.dart';
import 'package:gallery360/pages/search/vrgallery_search.dart';
import 'package:get/get.dart';
import '../../util/Util.dart';
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
    // print("###############################################################");
    // print("_tabController.index : ${_tabController.index}");
    _searchController.searchcomplete.value = false;
    if (_tabController.index == 0){
      _searchController.getSearchResult(query);
    //  _tabController.animateTo(0);
    }else if (_tabController.index == 1){
      _searchController.page.value = 1;
      _searchController.isLoadingComplete.value = false;
      _searchController.hasMore.value = true;
      _searchController.SearchArtistCategory.clear();
      _searchController.getSearchCategory("user");
    }else if (_tabController.index == 2){
      _searchController.page_art.value = 1;
      _searchController.isLoadingComplete_art.value = false;
      _searchController.hasMore_art.value = true;
      _searchController.SearchArtCategory.clear();
      _searchController.getSearchCategory("art");
    }else if (_tabController.index == 3){
      _searchController.page_vr.value = 1;
      _searchController.isLoadingComplete_vr.value = false;
      _searchController.hasMore_vr.value = true;
      _searchController.SearchVRCategory.clear();
      _searchController.getSearchCategory("vr");
    }else if (_tabController.index == 4){
      _searchController.page_news.value = 1;
      _searchController.isLoadingComplete_news.value = false;
      _searchController.hasMore_news.value = true;
      _searchController.SearchNewsCategory.clear();
      _searchController.getSearchCategory("news");
    }
  }

  void _chageTab(){
    print(_tabController.index);
    switch (_tabController.index) {
      case 0:
        if (_searchController.SearchArtTotalCount.value != 0){
         // _searchController.getSearchResult(query);
        }
      case 1:
        if (!_searchController.isLoadingComplete.value){
          _searchController.page.value = 1;
          _searchController.isLoadingComplete.value = false;
          _searchController.hasMore.value = true;
          _searchController.SearchArtistCategory.clear();
          _searchController.getSearchCategory("user");
        }
      case 2:
        if (!_searchController.isLoadingComplete_art.value){
          _searchController.page_art.value = 1;
          _searchController.isLoadingComplete_art.value = false;
          _searchController.hasMore_art.value = true;
          _searchController.SearchArtCategory.clear();
          _searchController.getSearchCategory("art");
        }
      case 3:
        if (!_searchController.isLoadingComplete_vr.value ){
          _searchController.page_vr.value = 1;
          _searchController.isLoadingComplete_vr.value = false;
          _searchController.hasMore_vr.value = true;
          _searchController.SearchVRCategory.clear();
          _searchController.getSearchCategory("vr");
        }
      case 4:
        if (!_searchController.isLoadingComplete_news.value){
          _searchController.page_news.value = 1;
          _searchController.isLoadingComplete_news.value = false;
          _searchController.hasMore_news.value = true;
          _searchController.SearchNewsCategory.clear();
          _searchController.getSearchCategory("news");
        }
    }
  }

  void CloseBtn(){
    _searchController.searchquery.text = "";

    if (_tabController.index == 0){

    }else if (_tabController.index == 1){
        _searchController.totalSearchCount.value = 0;
        _searchController.SearchArtistCategory.clear();
    }else if (_tabController.index == 2){
      _searchController.totalSearchCount_art.value = 0;
      _searchController.SearchArtCategory.clear();
    }else if (_tabController.index == 3){
      _searchController.totalSearchCount_vr.value = 0;
      _searchController.SearchVRCategory.clear();
    }else if (_tabController.index == 4){
      _searchController.totalSearchCount_news.value = 0;
      _searchController.SearchNewsCategory.clear();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _searchController.searchquery = TextEditingController();

    //print("시작한다....... : ${_searchController.searchquery.text}");
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_chageTab);
  }

  @override
  void dispose() {
    //_searchTextController.dispose();
    _searchController.searchquery.dispose();
    _tabController.dispose();
    _tabController.removeListener(_chageTab);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          floatingActionButton: actionButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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
                            CloseBtn();

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
                onTap: (index){
                //  print("Tab Click ${index}");
                //   if (index == 1){
                //     //작가 탭 클릭
                //     _searchController.page.value = 1;
                //     _searchController.isLoadingComplete.value = false;
                //     _searchController.hasMore.value = true;
                //     _searchController.SearchArtistCategory.clear();
                //     _searchController.getSearchCategory("user");
                //   }else if (index == 2){
                //     //작품 탭 클릭
                //     _searchController.page_art.value = 1;
                //     _searchController.isLoadingComplete_art.value = false;
                //     _searchController.hasMore_art.value = true;
                //     _searchController.SearchArtCategory.clear();
                //     _searchController.getSearchCategory("art");
                //   }else if (index == 3){
                //     //VR 갤러리 탭 클릭
                //     _searchController.page_vr.value = 1;
                //     _searchController.isLoadingComplete_vr.value = false;
                //     _searchController.hasMore_vr.value = true;
                //     _searchController.SearchVRCategory.clear();
                //     _searchController.getSearchCategory("vr");
                //   }else if (index == 4){
                //     //News 탭 클릭
                //     _searchController.page_news.value = 1;
                //     _searchController.isLoadingComplete_news.value = false;
                //     _searchController.hasMore_news.value = true;
                //     _searchController.SearchNewsCategory.clear();
                //     _searchController.getSearchCategory("news");
                //   }
                },

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
                    TotalSeachPage(tab: _tabController,),
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


