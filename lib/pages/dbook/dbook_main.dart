import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:gallery360/util/Util.dart';

class dbookService extends StatelessWidget {
  const dbookService({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "D-Book 제작 서비스 안내",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width,
                height:
                    ResponsiveBreakpoints.of(context).isMobile ? 1450 : ResponsiveBreakpoints.of(context).isTablet ? 3000 : 4300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/dbook/book_detail2_1.jpg"),
                        fit: BoxFit.fill)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //1열 정보
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dbooklist(
                      width: width,
                      imagepath: "book_01.png",
                      link: "https://www.gallery360.co.kr/public/dyson2.html",
                      title: " ",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    dbooklist(
                      width: width,
                      imagepath: "book_11.png",
                      link:
                          "https://www.d-book.co.kr/dbooks/hmall/expired/MjAtMTAtNQ/dyson.html",
                      title: " ",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    dbooklist(
                      width: width,
                      imagepath: "book_12.png",
                      link:
                          "https://www.d-book.co.kr/dbooks/hmall/expired/aGFuc3NlbQ/hanssem.html",
                      title: " ",
                    ),
                  ],
                ),
                Container(
                  width: width * 0.98,
                  height: ResponsiveBreakpoints.of(context).isMobile ? 13 : 25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/dbook/stand.png"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),

            //2열 정보
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dbooklist(
                      width: width,
                      imagepath: "book_15.png",
                      link:
                          "https://www.d-book.co.kr/dbooks/co/YW5hbG9nZGV2aWNl/info.html",
                      title: " ",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    dbooklist(
                      width: width,
                      imagepath: "book_06.png",
                      link: "https://www.d-book.co.kr/dbooks/co/QS1MaWZl/",
                      title: " ",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    dbooklist(
                      width: width,
                      imagepath: "book_09.png",
                      link:
                          "https://www.d-book.co.kr/dbooks/hmall/MjAyMDA3/info.html",
                      title: " ",
                    ),
                  ],
                ),
                Container(
                  width: width * 0.98,
                  height: ResponsiveBreakpoints.of(context).isMobile ? 13 : 25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/dbook/stand.png"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),

            //3열 정보
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dbooklist(
                      width: width,
                      imagepath: "book_04.png",
                      link:
                          "https://www.d-book.co.kr/dbooks/gallery360/sample/seoulnews/news.html",
                      title: " ",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    dbooklist(
                      width: width,
                      imagepath: "book_03.png",
                      link:
                          "https://www.gallery360.co.kr/public/gallery360_V1.html",
                      title: " ",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    dbooklist(
                      width: width,
                      imagepath: "book_02.png",
                      link:
                          "https://www.gallery360.co.kr/test/deploy/test2.html",
                      title: " ",
                    ),
                  ],
                ),
                Container(
                  width: width * 0.98,
                  height: ResponsiveBreakpoints.of(context).isMobile ? 13 : 25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/dbook/stand.png"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),

            //4열 정보
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dbooklist(
                      width: width,
                      imagepath: "book_05.png",
                      link:
                          "https://www.gallery360.co.kr/dbooks/gallery360/rental/info.html",
                      title: " ",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    dbooklist(
                      width: width,
                      imagepath: "book_07.png",
                      link: "https://www.gallery360.co.kr/public/paju1.html",
                      title: " ",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    dbooklist(
                      width: width,
                      imagepath: "book_08.png",
                      link:
                          "https://www.gallery360.co.kr/dbooks/gallery360/introduce/info.html",
                      title: " ",
                    ),
                  ],
                ),
                Container(
                  width: width * 0.98,
                  height: ResponsiveBreakpoints.of(context).isMobile ? 13 : 25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/dbook/stand.png"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),

            //5열 정보
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dbooklist(
                      width: width,
                      imagepath: "book_10.png",
                      link:
                          "https://www.gallery360.co.kr/dbooks/gallery360/MjAyMDAzMjY=/info.html",
                      title: " ",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    dbooklist(
                      width: width,
                      imagepath: "book_14.png",
                      link:
                          "https://www.d-book.co.kr/dbooks/co/expired/cGFpbnRlcnVz/info.html",
                      title: " ",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    dbooklist(
                      width: width,
                      imagepath: "book_13.png",
                      link:
                          "https://www.d-book.co.kr/dbooks/edu/7Jew7IS464yAUkMx/info.html",
                      title: " ",
                    ),
                  ],
                ),
                Container(
                  width: width * 0.98,
                  height: ResponsiveBreakpoints.of(context).isMobile ? 13 : 25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/dbook/stand.png"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width,
                decoration: const BoxDecoration(
                  color: Color(0xffeceef4)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                     // const Text("Gallery360"),
                      const SizedBox(height: 20,),
                      RichText(
                        text: TextSpan(
                          //text: "하단",
                          //style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(text: "하단 ", style: TextStyle(color: Colors.black, fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 20 : 13)),
                            TextSpan(text: '[제작요청서]', style: TextStyle(color: Color(0xff6f43d6), fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 20 : 13)),
                            TextSpan(text: "를 다운로드 받아 작성 후", style: TextStyle(color: Colors.black, fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 20 : 13))
                          ]
                        ),
                      ),
                      //Text("하단 [제작요청서]를 다운로드 받아 작성 후"),
                      Text("together@gallery360.co.kr 메일 주소로", style: TextStyle(fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 20 : 13) ),
                      Text("발송해 주세요", style: TextStyle(fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 20 : 13) ),
                      const SizedBox(height: 30,),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xff6f43d6)),
                          foregroundColor: const Color(0xff6f43d6),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {
                          openFile(
                              url:
                                  "https://meet.kmslab.com:8444/WMeet/FDownload.do?id=659565277be62549e65734b1&ty=1",
                              fileName: "D-Book 제작요청서.docx");
                        },
                        child: Text("제작요청서 다운받기", style: TextStyle(fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 20 : 13) ),
                      ),
                      const SizedBox(height: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("문 의 070-8803-0123", style: TextStyle(fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 20 : 13) ,),
                          Text("카카오툭에서 '갤러리360'을 검색해 주세요", style: TextStyle(fontSize: ResponsiveBreakpoints.of(context).isDesktop ? 20 : 13),),
                        ],
                      ),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class dbooklist extends StatelessWidget {
  const dbooklist({
    super.key,
    required this.width,
    required this.imagepath,
    required this.link,
    required this.title,
  });

  final double width;
  final String imagepath;
  final String link;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Util.UrlOpenWebview(link, title);
        //Util.UrlOpen(link);
      },
      child: Container(
        width: width * 0.29,
        height: ResponsiveBreakpoints.of(context).isMobile ? 155 : ResponsiveBreakpoints.of(context).isTablet ? 300 : 450,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/dbook/$imagepath"),
                fit: BoxFit.fill)),
      ),
    );
  }
}
