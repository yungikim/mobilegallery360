import 'package:flutter/material.dart';

class SpaceBar5 extends StatelessWidget {
  const SpaceBar5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      alignment: Alignment.center,
      //  color: Colors.red,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/mainPage/banner-04-img.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "당신의 공간에 다양한 작품을 미리 걸어보세요",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const Text(
              "내 공간에 작품 걸어보기 서비스는 당신의 가장 소중한 공간을 풍요롭게 채워드립니다.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                backgroundColor: Colors.black,
              ),
              child: const Text(
                "시작하기",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
