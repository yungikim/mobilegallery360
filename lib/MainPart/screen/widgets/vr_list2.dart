import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:gallery360/MainPart/screen/widgets/models/vr_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../util/Util.dart';

class VRList2 extends StatefulWidget {
  const VRList2({super.key});

  @override
  State<VRList2> createState() => _VRList2State();
}

class _VRList2State extends State<VRList2> {
  final DataController _dataController = Get.put(DataController());
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    checkVR();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void checkVR() {
    _dataController.getVrListDataCallDio().then((value) {
      _dataController.vrListData.value = value;
      for (int i = 0; i < _dataController.vrListData.value.length; i++) {
        VRModel vr = _dataController.vrListData.value[i];
        if (vr.email != null) {
          _dataController.emails.add(vr.email.toString());
          _dataController.dockeys.add(vr.dockey.toString());
          String url =
              "https://www.gallery360.co.kr/vr/vr/vrgallery/${vr.email}/${vr.dockey}/pano_f.jpg";
          _dataController.imageURLs.add(url);

            if (i.isOdd) {
              _dataController.half_list.add(url);
            }

        }
      }
      _dataController.vrListInit.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_dataController.vrListInit.value) {
        return _dataController.isMobile.value
            ? CarouselMobile(
                dataController: _dataController,
                carouselController: _carouselController,
              )
            : CarouselTablet(
                dataController: _dataController,
                carouselController: _carouselController,
              );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

class CarouselTablet extends StatelessWidget {
  const CarouselTablet({
    super.key,
    required DataController dataController,
    required CarouselController carouselController,
  })  : _dataController = dataController,
        _carouselController = carouselController;

  final DataController _dataController;
  final CarouselController _carouselController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: (_dataController.vrListData.length / 2).round(),
          itemBuilder: (context, index, realIdx) {
            final int first = index * 2;
            final int second = first + 1;
            return Row(
              children: [first, second].map((idx) {
                var e = _dataController.vrListData[idx];
                return Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(_dataController.imageURLs[idx]),
                      fit: BoxFit.cover,
                    )),
                    child: CarouselInnerText(
                      e: e,
                    ),
                  ),
                );
              }).toList(),
            );
          },
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 250,
            autoPlay: true,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 10),
            onPageChanged: (index, reason) {
              _dataController.vrcurrentItem.value = index;
            },
          ),
        ),
        CarouselDot(
          dataController: _dataController,
          carouselController: _carouselController,
          imageL: _dataController.half_list,
        ),
      ],
    );
  }
}

class CarouselMobile extends StatelessWidget {
  const CarouselMobile({
    super.key,
    required DataController dataController,
    required CarouselController carouselController,
  })  : _dataController = dataController,
        _carouselController = carouselController;

  final DataController _dataController;
  final CarouselController _carouselController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: _dataController.vrListData.length,
          itemBuilder: (context, index, realIdx) {
            final e = _dataController.vrListData[index];
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  //  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.darken),
                    image: NetworkImage(
                        "https://www.gallery360.co.kr/vr/vr/vrgallery/${e.email}/${e.dockey}/pano_f.jpg"),
                    fit: BoxFit.cover,
                  )),
              child: CarouselInnerText(
                e: e,
              ),
            );
          },
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 250,
            autoPlay: true,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 10),
            onPageChanged: (index, reason) {
              _dataController.vrcurrentItem.value = index;
            },
          ),
        ),
        CarouselDot(
          dataController: _dataController,
          carouselController: _carouselController,
          imageL: _dataController.imageURLs,
        ),
      ],
    );
  }
}

class CarouselInnerText extends StatelessWidget {
  const CarouselInnerText({super.key, required this.e});
  final VRModel e;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 20.0,
          left: 15.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Util.chageText(e.title.toString()),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 0.0),
                        blurRadius: 3,
                        color: Colors.black,
                      )
                    ]),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "${e.nickname}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 0.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                      )
                    ]),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.dataset_linked,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 0.0),
                        blurRadius: 3,
                        color: Colors.black,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${e.read}",
                    style: const TextStyle(color: Colors.white, shadows: [
                      Shadow(
                        offset: Offset(1, 0),
                        blurRadius: 3,
                        color: Colors.black,
                      )
                    ]),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 0.0),
                        blurRadius: 3,
                        color: Colors.black,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${e.like}",
                    style: const TextStyle(color: Colors.white, shadows: [
                      Shadow(
                        offset: Offset(1.0, 0.0),
                        blurRadius: 3,
                        color: Colors.black,
                      )
                    ]),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class CarouselDot extends StatelessWidget {
  const CarouselDot(
      {super.key,
      required DataController dataController,
      required CarouselController carouselController,
      required this.imageL})
      : _dataController = dataController,
        _carouselController = carouselController;

  final DataController _dataController;
  final CarouselController _carouselController;
  final List<String> imageL;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imageL.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () {
            _carouselController.animateToPage(entry.key);
            _dataController.vrcurrentItem.value = entry.key;
          },
          child: Obx(
            () => Container(
              width: 12.0,
              height: 12.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(
                          _dataController.vrcurrentItem.value == entry.key
                              ? 0.9
                              : 0.4)),
            ),
          ),
        );
      }).toList(),
    );
  }
}
