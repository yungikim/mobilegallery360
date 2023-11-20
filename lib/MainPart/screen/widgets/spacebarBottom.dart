import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpacebarBottom extends StatelessWidget {
  const SpacebarBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "상호 : 갤러리360(주) | 대표 : 신효미",
            style: TextStyle(color: Colors.white, fontSize: 13, height: 1.7),
            textAlign: TextAlign.center,
          ),
          const Text(
            "사업자등록번호 : 828-88-01007 | 호스팅 제공자 : Google Cloud Platform",
            style: TextStyle(color: Colors.white, fontSize: 13, height: 1.7),
            textAlign: TextAlign.center,
          ),
          const Text(
            "통신판매업신고 : 제2019-경기파주-0223호",
            style: TextStyle(color: Colors.white, fontSize: 13, height: 2),
            textAlign: TextAlign.center,
          ),
          const Text(
            "주소 : 경기도 파주시 소리천로25, 916호(유은타워 7차)",
            style: TextStyle(color: Colors.white, fontSize: 13, height: 1.7),
            textAlign: TextAlign.center,
          ),
          const Text(
            "E-mail : help@gallery360.co.kr",
            style: TextStyle(color: Colors.white, fontSize: 13, height: 1.7),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Copyright © 2018-2023 Gallery360. All Rights Reserved.",
            style: TextStyle(color: Colors.white, fontSize: 13, height: 1.7),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "070-8803-0123",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Text(
            "평일 10:00 ~ 17:00",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/mainPage/btn-footer-instagram.svg",
                width: 55,
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                "assets/images/mainPage/btn-footer-facebook.svg",
                width: 55,
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                "assets/images/mainPage/btn-footer-naver-blog.svg",
                width: 55,
              ),
              const SizedBox(
                width: 8,
              ),
              Image.asset(
                "assets/images/mainPage/btn-youtube2.png",
                width: 59,
              ),
            ],
          )
        ],
      ),
    );
  }
}
