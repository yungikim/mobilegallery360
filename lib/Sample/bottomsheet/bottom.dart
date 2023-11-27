import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(test());
}

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: test2(),
    );
  }
}


class test2 extends StatelessWidget {
  const test2({super.key});


  void openBottomSheet() {
    Get.bottomSheet(
        SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'bottom sheet',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: Get.back,
                child: const Text('닫기'),
              )
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.red,
      isDismissible: false,
      enableDrag: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Sheet Sample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Show bottomsheet'),
              onPressed: () {
                openBottomSheet();
              }
            ),
            ElevatedButton(onPressed: (){
              showModalBottomSheet(context: context, builder: (context){
                return SingleChildScrollView(
                  child: Container(
                    height: 500,
                  ),
                );
              });
            }, child: Text("showmodel sheet"))
          ],
        ),
      ),
    );
  }
}

