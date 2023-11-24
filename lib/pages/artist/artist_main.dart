import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gallery360/pages/artist/controller/artist_controller.dart';
import 'package:gallery360/pages/artist/model/artist_model.dart';
import 'package:gallery360/pages/artist/util/image_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ArtistMainPage extends StatefulWidget {
  const ArtistMainPage({super.key});

  @override
  State<ArtistMainPage> createState() => _ArtistMainPageState();
}

class _ArtistMainPageState extends State<ArtistMainPage> {
  var selectkey = "1";
  late ScrollController _scrollController;
  final ArtistController _artistController = Get.put(ArtistController());
  final TextEditingController queryController = TextEditingController();

  //콤보박스 설정하기
  late List<DropdownMenuItem<ValueOptions>> _valueItems;
  late ValueOptions _selectedValue;

  void fetch() async{
    await _artistController.getArtist();
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(onScroll);

    _artistController.dataLoadingComplete.value = false;
    _artistController.getArtist();

    //콤보 박스 설정하기
    List<ValueOptions> values = ValueOptions.allValuesOptions;
    _valueItems =
        values.map<DropdownMenuItem<ValueOptions>>((ValueOptions valueOption) {
          return DropdownMenuItem<ValueOptions>(
            value: valueOption,
            child: Text(valueOption.title),
          );
        }).toList();

    _selectedValue = values[1];
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(onScroll);
    queryController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;

    if (maxScroll == currentScroll && _artistController.hasMore.value) {
      _artistController.getArtist();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              if (ZoomDrawer.of(context)!.isOpen()) {
                ZoomDrawer.of(context)!.close();
              } else {
                ZoomDrawer.of(context)!.open();
              }
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Image(
              image: AssetImage("assets/images/logo/logo.png"),
              width: 130,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ],
        ),
        body: Obx(() {
          if (_artistController.dataLoadingComplete.value) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  floating: false,
                  pinned: false,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Colors.black,
                      child: const Image(
                        image: AssetImage("assets/images/logo/main-visual.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: const Text("A r t i s t"),
                    centerTitle: true,
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            decoration: const BoxDecoration(
                              // border: Border.all(color: Colors.grey)
                            ),
                            child: DropdownButton<ValueOptions>(
                              isExpanded: true,
                              //  menuMaxHeight: 300.0,
                              //  itemHeight: null,
                              underline: SizedBox(),
                              value: _selectedValue,
                              items: _valueItems,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedValue = newValue!;
                                  _artistController.type.value = _selectedValue.key;
                                  _artistController.refreshData();
                                  // state2.getUser();
                                  // print(_selectedValue.key);
                                });
                              },
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            bottom: 1,
                            child: SizedBox(
                              height: 10,
                              width: 150,
                              // color: Colors.red,
                              child: TextField(
                                textInputAction: TextInputAction.search,
                                onSubmitted: (value) {
                                  print("search query : $value");
                                  _artistController.dataLoadingComplete.value = false;
                                  _artistController.artists.value = <ArtistModel>[];
                                  _artistController.searchUser(value);
                                },
                                controller: queryController,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  contentPadding: const EdgeInsets.only(
                                      top: 10.0, left: 6.0, bottom: 10.0),
                                  hintText: '작가 검색',
                                  hintStyle: TextStyle(
                                      fontSize: 17.0, color: Colors.grey[500]),
                                  focusedBorder: const UnderlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            right: 5,
                            top: 17,
                            child: Icon(
                              Icons.search,
                              size: 20.0,
                            ),
                          ),
                        ],
                      ),
                    )),
                SliverToBoxAdapter(
                  child: MasonryGridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  //  itemCount: _artistController.isSearch.value ? _artistController.artists.length : _artistController.artists_search.length,
                    itemCount: _artistController.artists.length,
                    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                    itemBuilder: (context, index){
                      return ImageCard(index:index);
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
        }));
  }
}


class ValueOptions {
  final String key;
  final String title;

  ValueOptions(this.key, this.title);

  static List<ValueOptions> get allValuesOptions => [
    ValueOptions("0", "랜덤정렬"),
    ValueOptions("1", "최신순"),
    ValueOptions("2", "이름순"),
  ];
}