import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowMyRoom extends StatelessWidget {
  const ShowMyRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("내 공간에 작품 걸어보기", style: TextStyle(fontSize: 22, color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
      ),
    );
  }
}
