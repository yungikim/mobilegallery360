import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery360/Sample/listview/data_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';

import '../../main.dart';
import '../../util/Util.dart';
import 'data_model.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MainP());
}

class MainP extends StatelessWidget {
  const MainP({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MPP(),
    );
  }
}

class MPP extends StatefulWidget {
  const MPP({super.key});

  @override
  State<MPP> createState() => _MPPState();
}

class _MPPState extends State<MPP> {
  final DataController _dataController = DataController();

  @override
  void initState() {
    // _dataController.getFirstPageArtData2();
    _dataController.getFirstPageArtDataCallDio();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    var f = NumberFormat('###,###,###,###');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Staggered Grid View"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                    HeaderWidget("Header 1"),
                    HeaderWidget("Header 2"),
                    HeaderWidget("Header 3"),
                    HeaderWidget("Header 4"),
                  ]
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BodyWidget(Colors.blue),
                  BodyWidget(Colors.red),
                  BodyWidget(Colors.green),
                  BodyWidget(Colors.orange),
                  BodyWidget(Colors.blue),
                  BodyWidget(Colors.red),
                  BodyWidget(Colors.blue),
                  SizedBox(height: 50.0,),
                ]
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 750,
                child: MasonryGridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.all(20.0),
                      height: 100,
                      color: Colors.red,
                    );
                  },
                ),
              ),
            ),

            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                    color: Colors.cyanAccent,
                    child: Text("$index"),
                  ),
                  childCount: 10,
                ),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: const [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ))

          ],
        )
      ),
    );
  }
}


class HeaderWidget extends StatelessWidget {
  final String text;

  HeaderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(text),
      color: Colors.grey[200],
    );
  }
}

class BodyWidget extends StatelessWidget {
  final Color color;

  BodyWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: color,
      alignment: Alignment.center,

    );
  }
}
class BodyWidget2 extends StatelessWidget {
  final Color color;

  BodyWidget2(this.color);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: MasonryGridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        itemCount: 10,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.all(20.0),
            height: 100,
            color: Colors.red,
          );
        },
      ),
    );
  }
}
