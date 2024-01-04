import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery360/util/Util.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class SpacebarBottom extends StatelessWidget {
  const SpacebarBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 450,
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            tr('main_54'),
            style: TextStyle(color: Colors.white, fontSize: Util.fSize13, height: 1.7),
            textAlign: TextAlign.center,
          ),
          Text(
            tr('main_55'),
            style: TextStyle(color: Colors.white, fontSize: Util.fSize13, height: 1.7),
            textAlign: TextAlign.center,
          ),
          Text(
            tr('main_56'),
            style: TextStyle(color: Colors.white, fontSize: Util.fSize13, height: 2),
            textAlign: TextAlign.center,
          ),
          Text(
            tr('main_57'),
            style: TextStyle(color: Colors.white, fontSize: Util.fSize13, height: 1.7),
            textAlign: TextAlign.center,
          ),
          Text(
            "E-mail : help@gallery360.co.kr",
            style: TextStyle(color: Colors.white, fontSize: Util.fSize13, height: 1.7),
            textAlign: TextAlign.center,
          ),
          Text(
            "Copyright © 2018-2023 Gallery360. All Rights Reserved.",
            style: TextStyle(color: Colors.white, fontSize:Util.fSize13, height: 1.7),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "070-8803-0123",
            style: TextStyle(
              fontSize: Util.fSize20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            tr('main_58'),
            style: TextStyle(
              fontSize: Util.fSize15,
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
              OutlinedButton(
                onPressed: () {
                  Util.UrlOpen("http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=8288801007");
                },
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: const EdgeInsets.all(5),
                  side: const BorderSide(color: Colors.white),
                ),
                child: Text(tr('main_59'), style: TextStyle(color: Colors.white, fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 15 :  10),),
              ),
              const SizedBox(width: 10,),
              OutlinedButton(
                onPressed: () {
                  Util.UrlOpen("https://www.gallery360.co.kr/admin_new/privacy.jsp");
                },
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: const EdgeInsets.all(5),
                  side: const BorderSide(color: Colors.white),
                ),
                child: Text(tr('main_60'), style: TextStyle(color: Colors.white, fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 15 :  10),),
              ),
              const SizedBox(width: 10,),
              OutlinedButton(
                onPressed: () {
                  Util.UrlOpen("https://www.gallery360.co.kr/admin_new/terms.jsp");
                },
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: const EdgeInsets.all(5),
                  side: const BorderSide(color: Colors.white),
                ),
                child: Text(tr('main_61'), style: TextStyle(color: Colors.white, fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 15 :  10),),
              ),
              // const SizedBox(width: 10,),
              // OutlinedButton(
              //   onPressed: () {
              //     Util.UrlOpen("http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=8288801007");
              //   },
              //   style: OutlinedButton.styleFrom(
              //     shape: const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.zero,
              //     ),
              //     padding: const EdgeInsets.all(5),
              //     side: const BorderSide(color: Colors.white),
              //   ),
              //   child: const Text("헬프센터", style: TextStyle(color: Colors.white),),
              // ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Util.UrlOpen("https://www.instagram.com/gallery360.inc/");
                },
                child: SvgPicture.asset(
                  "assets/images/mainPage/btn-footer-instagram.svg",
                  width: 55,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: (){
                  Util.UrlOpen("https://www.facebook.com/gallery360.Inc/");
                },
                child: SvgPicture.asset(
                  "assets/images/mainPage/btn-footer-facebook.svg",
                  width: 55,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: (){
                  Util.UrlOpen("https://blog.naver.com/vrgallery360");
                },
                child: SvgPicture.asset(
                  "assets/images/mainPage/btn-footer-naver-blog.svg",
                  width: 55,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: (){
                  Util.UrlOpen("https://www.youtube.com/channel/UCIkKP_U4KWbe0zbmwIUsOxw?view_as=subscriber");
                },
                child: Image.asset(
                  "assets/images/mainPage/btn-youtube2.png",
                  width: 59,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}
