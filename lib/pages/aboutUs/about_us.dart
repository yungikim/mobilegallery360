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
                                  Text("신 효 미",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                  ),),
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
          ],
        ));
  }
}
