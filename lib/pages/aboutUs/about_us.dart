import 'package:flutter/material.dart';
import 'package:gallery360/pages/aboutUs/controller/about_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: customAppBar(context),
        ),
        body: CustomScrollView(
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
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/mainPage/company_brief_visual.jpg"),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Art Technology Company",
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Gallery360 Company Brief",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 2,
                            width: 50,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Util.addComma2(vrsum),
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff9b3fe3)),
                              ),
                              Text(
                                "회의 온라인 VR대관 전시",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Util.addComma2(client),
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff9b3fe3)),
                              ),
                              Text(
                                "명의 클라이언트",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Util.addComma2(tsum),
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff9b3fe3)),
                              ),
                              Text(
                                "명의 작가,아트컨설턴트,전시기획자",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Util.addComma2(art),
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff9b3fe3)),
                              ),
                              Text(
                                "점의 작품이",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            "함께합니다.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
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
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/mainPage/ci_greeting.jpg",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 600,
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
                            const Text(
                              "안녕하세요,",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "갤러리360입니다.",
                              style: TextStyle(
                                  fontSize: 25,
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
                            const Text(
                              "따뜻한 전문가 집단인 갤러리360은 최신 기술의 융합 및 연계를 통해 적정 기술에 대한 다양한 연구를 하고 있으며, 예술 산업 내에서 미래지향적인 포트폴리오를 만들어가며 꾸준히 성장하고 있습니다.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "각박한 현대인의 삶 안에서 예술이 숨 쉴 수 있도록 온택트 전시 플랫폼 갤러리360을 통해 세상에 꼭 필요한 서비스를 만들어가고 있습니다.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const SizedBox(
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
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "신 효 미",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
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
                child: Container(
                  height: 700,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "갤러리360(주)은",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  letterSpacing: 1.2)),
                          TextSpan(
                              text: "아트 테크놀로지",
                              style: TextStyle(
                                  color: Color(0xff9b3fe4),
                                  fontSize: 18,
                                  letterSpacing: 1.2)),
                          TextSpan(
                              text: " 분야의",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  letterSpacing: 1.2)),
                          TextSpan(
                              text: "선도기업",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2)),
                          TextSpan(
                              text:
                                  "으로서 작가 지원, 온택트 전시 솔루션 VR갤러리 대관, 디지털 출판 솔루션 D-BOOK 연구개발 등의 서비스를 제공합니다.",
                              style: TextStyle(
                                  fontSize: 18,
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
                      const Text(
                        "MISSION",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "IT기술을 기반으로 미술 작품과 소비자를 연결하고 창작자들의 삶을 지원하는 일상적인 예술문화를 주도합니다.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
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
                      const Text(
                        "VISION",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "예술이 당신의 일상에 다가갈 수 있는 IT서비스로 모두를 위한 다채로운 변화와 울림을 이끌어냅니다.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
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
                    Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: const Text(
                        "회사소개서 PDF 다운로드",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: const Text(
                        "대관서비스 소개서 PDF 다운로드",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
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
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/mainPage/${images[index]}"),
                        fit: BoxFit.cover
                      )
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
