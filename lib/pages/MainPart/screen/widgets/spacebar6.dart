import 'package:flutter/material.dart';

class SpaceBar6 extends StatelessWidget {
  const SpaceBar6({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
     // color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Row(
              children: [
                Image.asset(
                  "assets/images/mainPage/icon-event-01.png",
                  width: 70,
                ),
                const SizedBox(
                  width: 30,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "아트 쇼핑매거진 신청하기",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "신청하기",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(0.1),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/mainPage/icon-event-02@2x.png",
                  width: 70,
                ),
                const SizedBox(
                  width: 30,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "실시간으로 문의하기",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "카카오톡 채널 친구추가",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(0.1),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Image.asset(
                  "assets/images/mainPage/icon-event-03@2x.png",
                  width: 70,
                ),
                const SizedBox(
                  width: 30,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "인공지능이 그려주는 그림",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "AI Painter 무료 체험하기",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
