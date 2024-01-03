import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class dbookService extends StatelessWidget {
  const dbookService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: () { Get.back();},),
        title: Text("D-Book 제작 서비스 안내", style: TextStyle(color: Colors.white, fontSize: 18),),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
