import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/pages/aboutUs/controller/about_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../util/Util.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final AboutController _aboutController = Get.put(AboutController());

  final images = [
    "ci_visual_acon.jpg",
    "ci_visual_acol.jpg",
    "ci_visual_ap.jpg",
    "ci_visual_vr.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final double default1 = ResponsiveBreakpoints.of(context).isDesktop ? 40 : 28;
    final double default2 = ResponsiveBreakpoints.of(context).isDesktop ? 30 : 20;
    final double default3 = ResponsiveBreakpoints.of(context).isDesktop ? 25 : 16;
    final double default4 = ResponsiveBreakpoints.of(context).isDesktop ? 38 : 25;
    final double default5 = ResponsiveBreakpoints.of(context).isDesktop ? 20 : 14;
    final double default6 = ResponsiveBreakpoints.of(context).isDesktop ? 22 : 18;
    final double default7 = ResponsiveBreakpoints.of(context).isDesktop ? 33 : 22;

    return Scaffold(
        floatingActionButton: actionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: customAppBar(context),
        ),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: FutureBuilder(
                future: _aboutController.getAboutUs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    int vrcount = snapshot.data["vr"];
                    int artvr = snapshot.data["artvr_cnt"];
                    int vrsum = vrcount + artvr;
                    int client = snapshot.data["normal"];
                    int artist = snapshot.data["artist"];
                    int curator = snapshot.data["curator"];
                    int rental = snapshot.data["rental"];
                    int tsum = artist + curator + rental;
                    int art = snapshot.data["cnt_amount"];
                    return Container(
                      height: ResponsiveBreakpoints.of(context).isDesktop ? 700 : 500,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/mainPage/company_brief_visual.jpg"),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Art Technology Company",
                            style: TextStyle(fontSize: default1, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Gallery360 Company Brief",
                            style: TextStyle(fontSize: default2, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 2,
                            width: 50,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Util.addComma2(vrsum),
                                style: TextStyle(
                                    fontSize: default3 , color: Color(0xff9b3fe3)),
                              ),
                              Text(
                                "회의 온라인 VR대관 전시",
                                style: TextStyle(
                                    fontSize: default3, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Util.addComma2(client),
                                style: TextStyle(
                                    fontSize: default3, color: Color(0xff9b3fe3)),
                              ),
                              Text(
                                "명의 클라이언트",
                                style: TextStyle(
                                    fontSize: default3, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Util.addComma2(tsum),
                                style: TextStyle(
                                    fontSize: default3, color: Color(0xff9b3fe3)),
                              ),
                              Text(
                                "명의 작가,아트컨설턴트,전시기획자",
                                style: TextStyle(
                                    fontSize: default3, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Util.addComma2(art),
                                style: TextStyle(
                                    fontSize: default3, color: Color(0xff9b3fe3)),
                              ),
                              Text(
                                "점의 작품이",
                                style: TextStyle(
                                    fontSize: default3, color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            "함께합니다.",
                            style: TextStyle(fontSize: default3, color: Colors.white),
                          )
                        ],
                      ),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Connection Error"),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/mainPage/ci_greeting.jpg",
                      fit: BoxFit.cover,
                      width: width,
                    ),
                    Container(
                      height: ResponsiveBreakpoints.of(context).isMobile
                          ? 650
                          : 550,
                      width: double.infinity,
                      color: const Color(0xffb3adb0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              "안녕하세요,",
                              style: TextStyle(
                                  fontSize: default4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "갤러리360입니다.",
                              style: TextStyle(
                                  fontSize: default4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 3,
                              width: 50,
                              color: const Color(0xff9b3fe3),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              "따뜻한 전문가 집단인 갤러리360은 최신 기술의 융합 및 연계를 통해 적정 기술에 대한 다양한 연구를 하고 있으며, 예술 산업 내에서 미래지향적인 포트폴리오를 만들어가며 꾸준히 성장하고 있습니다.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: default5,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "각박한 현대인의 삶 안에서 예술이 숨 쉴 수 있도록 온택트 전시 플랫폼 갤러리360을 통해 세상에 꼭 필요한 서비스를 만들어가고 있습니다.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: default5,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "갤러리360(주) 대표",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: default6,
                                    ),
                                  ),
                                  Text(
                                    "신 효 미",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: default7,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  // height:
                  //     ResponsiveBreakpoints.of(context).isMobile ? 750 : 650,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "갤러리360(주)은",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: default6,
                                  letterSpacing: 1.2)),
                          TextSpan(
                              text: "아트 테크놀로지",
                              style: TextStyle(
                                  color: Color(0xff9b3fe4),
                                  fontSize: default6,
                                  letterSpacing: 1.2)),
                          TextSpan(
                              text: " 분야의",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: default6,
                                  letterSpacing: 1.2)),
                          TextSpan(
                              text: "선도기업",
                              style: TextStyle(
                                  fontSize: default6,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2)),
                          TextSpan(
                              text:
                                  "으로서 작가 지원, 온택트 전시 솔루션 VR갤러리 대관, 디지털 출판 솔루션 D-BOOK 연구개발 등의 서비스를 제공합니다.",
                              style: TextStyle(
                                  fontSize: default6,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2))
                        ]),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        //padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.grey.withOpacity(0.3),
                            image: const DecorationImage(
                              scale: 1,
                              image: AssetImage(
                                  "assets/images/mainPage/ci_mission.png"),
                              //fit: BoxFit.contain
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "MISSION",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: default4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "IT기술을 기반으로 미술 작품과 소비자를 연결하고 창작자들의 삶을 지원하는 일상적인 예술문화를 주도합니다.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: default3,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        //padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.grey.withOpacity(0.3),
                            image: const DecorationImage(
                              scale: 1,
                              image: AssetImage(
                                  "assets/images/mainPage/ci_vision.png"),
                              //fit: BoxFit.contain
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "VISION",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: default4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "예술이 당신의 일상에 다가갈 수 있는 IT서비스로 모두를 위한 다채로운 변화와 울림을 이끌어냅니다.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: default3,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        openFile(
                          url: "https://meet.kmslab.com:8444/WMeet/FDownload.do?id=657735ce7be62549e6573488&ty=1",
                          fileName: "갤러리360_회사소개서.pdf"
                        );
                        // print("openfile");
                        // //OpenFile.open("https://www.gallery360.co.kr/cp_downloadFile.gu?type=Company");
                        // //FileDownloader.downloadFile(url: "https://www.gallery360.co.kr/cp_downloadFile.gu?type=Company");
                        // FileDownloader.downloadFile(
                        //     //https://exhibit.gallery360.co/book/dbook.jsp?key=/artimage/contest@gallery360.co.kr-spl-1611884022207/art_portfolio/contest@gallery360.co.kr-spl-1611884022207_3caac8eb5e9372b007de526e7b1d8b48.5365773-1611884679299.pdf
                        //     url:
                        //         "https://meet.kmslab.com:8444/WMeet/FDownload.do?id=657735ce7be62549e6573488&ty=1",
                        //     name: "갤러리360_회사소개서.pdf",
                        //     onProgress: (name, progress) {
                        //       print(progress);
                        //     },
                        //     onDownloadCompleted: (String path) {
                        //       print("완료 되었습니다");
                        //       Get.snackbar(
                        //         "FileDownload",
                        //         "파일 다운로드가 완료 되었습니다.",
                        //         backgroundColor: Colors.blue,
                        //         snackPosition: SnackPosition.BOTTOM,
                        //    //     forwardAnimationCurve: Curves.elasticInOut,
                        //         reverseAnimationCurve: Curves.easeOut,
                        //       );
                        //     },
                        //     onDownloadError: (String error) {
                        //       print('DOWNLOAD ERROR: $error');
                        //     });
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        color: Colors.black,
                        alignment: Alignment.center,
                        child: Text(
                          "회사소개서 PDF 다운로드",
                          style: TextStyle(color: Colors.white, fontSize: default5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        openFile(
                            url: "https://meet.kmslab.com:8444/WMeet/FDownload.do?id=657735ce7be62549e6573487&ty=1",
                            fileName: "갤러리360_대관서비스_소개서.pdf"
                        );
                        // FileDownloader.downloadFile(
                        //   //https://exhibit.gallery360.co/book/dbook.jsp?key=/artimage/contest@gallery360.co.kr-spl-1611884022207/art_portfolio/contest@gallery360.co.kr-spl-1611884022207_3caac8eb5e9372b007de526e7b1d8b48.5365773-1611884679299.pdf
                        //     url:
                        //     "https://meet.kmslab.com:8444/WMeet/FDownload.do?id=657735ce7be62549e6573487&ty=1",
                        //     name: "갤러리360_대관서비스_소개서.pdf",
                        //     onProgress: (name, progress) {
                        //       print(progress);
                        //     },
                        //     onDownloadCompleted: (String path) {
                        //       print("완료 되었습니다");
                        //       Get.snackbar(
                        //         "FileDownload",
                        //         "파일 다운로드가 완료 되었습니다.",
                        //         backgroundColor: Colors.blue,
                        //         snackPosition: SnackPosition.BOTTOM,
                        //         //     forwardAnimationCurve: Curves.elasticInOut,
                        //         reverseAnimationCurve: Curves.easeOut,
                        //       );
                        //     },
                        //     onDownloadError: (String error) {
                        //       print('DOWNLOAD ERROR: $error');
                        //     });
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        color: Colors.black,
                        alignment: Alignment.center,
                        child: Text(
                          "대관서비스 소개서 PDF 다운로드",
                          style: TextStyle(color: Colors.white, fontSize: default5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/mainPage/${images[index]}"),
                            fit: BoxFit.cover)),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Smart Art Platform",
                  style: TextStyle(fontSize: default6),
                ),
                Text(
                  "Gallery360 Services",
                  style: TextStyle(fontSize: default1, fontWeight: FontWeight.bold),
                ),
                Accordion(
                  disableScrolling: true,
                  children: [
                    AccordionSection(
                      isOpen: true,
                      header: Text(
                        "VR갤러리 대관",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: default6,
                            color: const Color(0xff9b3fe4),
                            fontWeight: FontWeight.bold),
                      ),
                      headerBackgroundColorOpened: Colors.grey.withOpacity(0.3),
                      contentBorderColor: Colors.grey,
                      headerBackgroundColor: Colors.white,
                      headerBorderColor: Colors.grey,
                      headerBorderColorOpened: Colors.grey,
                      headerBorderWidth: 1,
                      headerBorderRadius: 0,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      content: SizedBox(
                        // height: ResponsiveBreakpoints.of(context).isMobile
                        //     ? 820
                        //     : 680,
                        width: double.infinity,
                        //   color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "고효율 저비용의 온라인 전시 솔루션",
                                style: TextStyle(fontSize: default5),
                              ),
                              Text(
                                "VR갤러리 대관",
                                style: TextStyle(
                                    fontSize: default4, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 70,
                                height: 2,
                                color: Colors.black,
                                margin:
                                    const EdgeInsets.only(bottom: 40, top: 20),
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_real.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "실제 갤러리에 있는 듯, 더욱 생생하게",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "VR갤러리 대관 서비스로 디지털 디바이스에서 최적화된 멀티미디어 콘텐츠 활용으로 언제 어디서나 끊김없는 비대면 전시를 개최할 수 있습니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_price.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "모든 혜택을 하나로 담아 경제적인 요금제",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: default5),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "월 15만원(부가세 별도)의 합리적인 가격으로 온라인 전시 개최에 필수적인 기능을 모두 담아 서비스 합니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_every.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "우리의 읽상이 아름다워지는 세상의 모든 전시",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: default5),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "갤러리360 플랫폼을 통해 다양한 온라인 전시를 누구나 무료로 관람할 수 있습니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "*2020년 8월 서비스 OPEN",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: default5,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 30,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AccordionSection(
                      isOpen: true,
                      header: Text(
                        "D-BOOK 출판",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: default6,
                            color: const Color(0xff9b3fe4),
                            fontWeight: FontWeight.bold),
                      ),
                      headerBackgroundColorOpened: Colors.grey.withOpacity(0.3),
                      contentBorderColor: Colors.grey,
                      headerBackgroundColor: Colors.white,
                      headerBorderColor: Colors.grey,
                      headerBorderColorOpened: Colors.grey,
                      headerBorderWidth: 1,
                      headerBorderRadius: 0,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      content: SizedBox(
                        // height: ResponsiveBreakpoints.of(context).isMobile
                        //     ? 780
                        //     : 660,
                        width: double.infinity,
                        //   color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "커뮤니케이션을 위한 새로운 대안",
                                style: TextStyle(fontSize: default5),
                              ),
                              Text(
                                "D-BOOK 출판 서비스",
                                style: TextStyle(
                                    fontSize: default4, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 70,
                                height: 2,
                                color: Colors.black,
                                margin:
                                    const EdgeInsets.only(bottom: 40, top: 20),
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_hub.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "브랜드 채널 유입을 돕는 콘텐츠 허브",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "D-BOOK은 갤러리360이 자체 개발한 이미지 베이스의 디지털 퍼블리싱 솔루션으로 URL로 간편하게 공유할 수 있습니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_pr.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "멀티미디어 콘텐츠로 더욱 강력한 홍보 효과",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: default5),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "D-BOOK은 이미지, 동영상, 웹링크 등 다양한 멀티미디어 포맷을 지원하고, 실시간 리포트로 브랜드 경험을 강화하고 홍보 효과를 빠르게 체감할 수 있습니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_page.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "페이지를 넘기는 감성적인 디자인",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: default5),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "플립북 형태의 아날로그 감성으로 연령에 관계 없이 친숙한 UI로 다가갑니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 30,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AccordionSection(
                      isOpen: true,
                      header: Text(
                        "360작가 지원",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: default6,
                            color: const Color(0xff9b3fe4),
                            fontWeight: FontWeight.bold),
                      ),
                      headerBackgroundColorOpened: Colors.grey.withOpacity(0.3),
                      contentBorderColor: Colors.grey,
                      headerBackgroundColor: Colors.white,
                      headerBorderColor: Colors.grey,
                      headerBorderColorOpened: Colors.grey,
                      headerBorderWidth: 1,
                      headerBorderRadius: 0,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      content: SizedBox(
                        // height: ResponsiveBreakpoints.of(context).isMobile
                        //     ? 850
                        //     : 710,
                        width: double.infinity,
                        //   color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "예술 생산자, 소비자와의 연결",
                                style: TextStyle(fontSize: default5),
                              ),
                              Text(
                                "360작가 지원",
                                style: TextStyle(
                                    fontSize: default4, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 70,
                                height: 2,
                                color: Colors.black,
                                margin:
                                    const EdgeInsets.only(bottom: 40, top: 20),
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_free.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "갤러리360 플랫폼 내 작가 페이지 제공",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "작가 노트 및 작품을 무제한으로 등록할 수 있는 온라인 상의 개인 포트폴리오 공간을 제공하고, 작품 원작 및 디지털 이미지 판매를 중개합니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "*온라인 상설 VR전시 개최를 무상으로 지원합니다.",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: default5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_project.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "갤러리360 주관 아트 프로젝트 참여",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: default5),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "페인터어스 작가 인터뷰, ART12 라이브 옥션 2020 들을 비롯 갤러리360이 주관하는 아트 프로젝트 참여의 기회를 제공하여 작가 및 작품 홍보를 돕습니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_debut.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "갤러리360 협약사를 통한 글로벌 진출 지원",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: default5),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "갤러리360의 글로벌 네트워크를 통해 신진 작가의 글로벌 시장 데뷔 과정을 돕습니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 30,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AccordionSection(
                      isOpen: true,
                      header: Text(
                        "작품 구매 지원",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: default6,
                            color: const Color(0xff9b3fe4),
                            fontWeight: FontWeight.bold),
                      ),
                      headerBackgroundColorOpened: Colors.grey.withOpacity(0.3),
                      contentBorderColor: Colors.grey,
                      headerBackgroundColor: Colors.white,
                      headerBorderColor: Colors.grey,
                      headerBorderColorOpened: Colors.grey,
                      headerBorderWidth: 1,
                      headerBorderRadius: 0,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      content: SizedBox(
                        // height: ResponsiveBreakpoints.of(context).isMobile
                        //     ? 780
                        //     : 640,
                        width: double.infinity,
                        //   color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "예술 생산자, 소비자와의 연결",
                                style: TextStyle(fontSize: default5),
                              ),
                              Text(
                                "작품 구매 지원",
                                style: TextStyle(
                                    fontSize: default4, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 70,
                                height: 2,
                                color: Colors.black,
                                margin:
                                    const EdgeInsets.only(bottom: 40, top: 20),
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_styling.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "‘내 공간에 작품 걸어보기’를 통한 작품 스타일링",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "작품 스타일링은 ‘내 공간에 작품 걸어보기’ 서비스를 통해 작품의 사이즈, 컬러감 등 예술 작품 구매를 돕는 기술입니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_airecon.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "인공지능 작품 추천",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: default5),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "갤러리360 플랫폼 내의 사용자 활동을 기반으로 취향에 맞는 작품을 추천합니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_aipaint.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "인공지능 페인터로 디지털 작품 제작",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: default5),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "과거의 예술 화풍을 학습한 인공지능 페인터 프로그램 큐리를 통해 사용자들은 새로운 디지털 작품을 직접 제작하거나 갤러리360 등록 작가에게 프로젝트를 의뢰할 수 있습니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 30,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AccordionSection(
                      isOpen: true,
                      header: Text(
                        "Art + IT 연구개발",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: default6,
                            color: const Color(0xff9b3fe4),
                            fontWeight: FontWeight.bold),
                      ),
                      headerBackgroundColorOpened: Colors.grey.withOpacity(0.3),
                      contentBorderColor: Colors.grey,
                      headerBackgroundColor: Colors.white,
                      headerBorderColor: Colors.grey,
                      headerBorderColorOpened: Colors.grey,
                      headerBorderWidth: 1,
                      headerBorderRadius: 0,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      content: SizedBox(
                        // height: ResponsiveBreakpoints.of(context).isMobile
                        //     ? 780
                        //     : 630,
                        width: double.infinity,
                        //   color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "예술과 IT의 융복합을 위한 기술적 선도",
                                style: TextStyle(fontSize: default5),
                              ),
                              Text(
                                "Art + IT 연구개발",
                                style: TextStyle(
                                    fontSize: default4, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 70,
                                height: 2,
                                color: Colors.black,
                                margin:
                                    const EdgeInsets.only(bottom: 40, top: 20),
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_tech.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "VR전시 관련 전문 기술력 보유",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "갤러리360은 VR전시 및 이를 이용한 콘텐츠 처리 기술에 있어서 R&D 인력의 끊임없는 연구개발을 통해 전문 기술력을 보유하고 있습니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_solution.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "예술 산업 트렌드를 선도하는 IT 솔루션 연구 개발",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: default5),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "제품의 입체감 구현을 휘한 3D/4D 작품 게시 기능 등 끊임없는 서비스 업데이트를 진행하고, 고객의 요구에 따라 커스터마이징 제품을 제안하고 있습니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                  "assets/images/mainPage/ci_svc_aitech.png"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "AI 기술 활용",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: default5),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "인공지능 머신러닝 기능을 활용한 플랫폼 서비스 고도화를 진행하고 있습니다.",
                                style: TextStyle(
                                  fontSize: default5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 30,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  // height:
                  //     ResponsiveBreakpoints.of(context).isMobile ? 1000 : 1800,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Gallery360 Symbol",
                        style: TextStyle(
                            fontSize: default4, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 2,
                        width: 50,
                        color: Colors.black,
                        margin: const EdgeInsets.only(top: 20, bottom: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "갤러리360의 심볼은 이니셜 G의 '의미'와 360도 회전이라는 '행위'를 결합하여 만들었습니다. 또한, Gradient Color Branding을 통해 예술적인 가치를 함께 담을 수 있습니다.",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: default6),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      Container(
                        width: width * 0.75,
                        height: ResponsiveBreakpoints.of(context).isMobile ? 300 : ResponsiveBreakpoints.of(context).isTablet ? 700 : 900,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/mainPage/ci_symbol_g.jpg"),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        width: width * 0.75,
                        height: ResponsiveBreakpoints.of(context).isMobile ? 300 : ResponsiveBreakpoints.of(context).isTablet ? 700 : 900,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/mainPage/ci_symbol_colour.jpg"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),

                      // SizedBox(
                      //     width: width ,
                      //     child: Image.asset(
                      //         "assets/images/mainPage/ci_symbol_g.jpg", width: 100)),
                      // SizedBox(
                      //     width: width * 0.75,
                      //     child: Image.asset(
                      //         "assets/images/mainPage/ci_symbol_colour.jpg")),

                      const SizedBox(height: 30,)
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
