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
  test2({super.key});

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
                }),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 40,
                                    child: const Text(
                                      "테마",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        squreBox("풍경"),
                                        squreBox("인물"),
                                        squreBox("정물"),
                                        squreBox("동물"),
                                        squreBox("추상"),
                                        squreBox("팝아트"),
                                        squreBox("오브제"),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 40,
                                    child: const Text(
                                      "색상",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        squreBox("풍경"),
                                        squreBox("인물"),
                                        squreBox("정물"),
                                        squreBox("동물"),
                                        squreBox("추상"),
                                        squreBox("팝아트"),
                                        squreBox("오브제"),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ));
                      });
                },
                child: Text("showmodel sheet"))
          ],
        ),
      ),
    );
  }
}

Widget squreBox(String text) {
  return Container(
    height: 80,
    width: 80,
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(color: Colors.grey),
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}

Widget squreCircle(String text) {
  return Container(
    height: 80,
    width: 80,
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(color: Colors.grey),
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
