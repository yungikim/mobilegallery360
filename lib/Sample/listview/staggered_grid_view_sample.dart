import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery360/Sample/listview/data_controller.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../../main.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Staggered Grid View"),
        ),
        body: Container(
          child: GridView.builder(
            itemCount: _dataController.firstPageArtData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index){
              DataModel dm = _dataController.firstPageArtData[index];
              return Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: Text("${dm.artTitle}"),
              );
            },
          ),
        ),
      ),
    );
  }
}
